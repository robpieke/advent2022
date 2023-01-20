import datatypes
import os
import regex

//-----------------------------------------------------------------------------
// Copy of https://github.com/vlang/v/blob/master/vlib/datatypes/linked_list.v
// but trimmed-down and adding a `tail` member for O(1) pushing.

pub struct ListNode[T] {
mut:
	data T
	next &ListNode[T] = unsafe { 0 }
}

pub struct LinkedList[T] {
mut:
	head &ListNode[T] = unsafe { 0 }
	tail &ListNode[T] = unsafe { 0 }
	len  int
}

pub fn (list LinkedList[T]) is_empty() bool {
	return list.len == 0
}

pub fn (list LinkedList[T]) len() int {
	return list.len
}

pub fn (mut list LinkedList[T]) push(item T) {
	new_node := &ListNode[T]{
		data: item
	}
	if unsafe { list.head == 0 } {
		list.head = new_node
	} else {
		list.tail.next = new_node
	}
	list.tail = new_node
	list.len += 1
}

pub fn (mut list LinkedList[T]) shift() !T {
	if unsafe { list.head == 0 } {
		return error('Linked list is empty')
	} else {
		list.len -= 1
		node := list.head
		list.head = node.next
		return node.data
	}
}

//-----------------------------------------------------------------------------

struct Blueprint {
	id                   int
	ore_robot_ore        int
	clay_robot_ore       int
	obsidian_robot_ore   int
	obsidian_robot_clay  int
	geode_robot_ore      int
	geode_robot_obsidian int
}

fn parse_blueprint(line string) ?Blueprint {
	query := r'.*(\d+).*(\d+).*(\d+).*(\d+).*(\d+).*(\d+).*(\d+).*'
	re := regex.regex_opt(query)?
	re.match_string(line)
	return Blueprint{
		id: re.get_group_by_id(line, 0).int()
		ore_robot_ore: re.get_group_by_id(line, 1).int()
		clay_robot_ore: re.get_group_by_id(line, 2).int()
		obsidian_robot_ore: re.get_group_by_id(line, 3).int()
		obsidian_robot_clay: re.get_group_by_id(line, 4).int()
		geode_robot_ore: re.get_group_by_id(line, 5).int()
		geode_robot_obsidian: re.get_group_by_id(line, 6).int()
	}
}

struct State {
mut:
	minute         int
	ore            int
	clay           int
	obsidian       int
	geode          int
	ore_robot      int
	clay_robot     int
	obsidian_robot int
	geode_robot    int
}

fn advance_state(state &State) State {
	return State{
		minute: state.minute + 1
		ore: state.ore + state.ore_robot
		clay: state.clay + state.clay_robot
		obsidian: state.obsidian + state.obsidian_robot
		geode: state.geode + state.geode_robot
		ore_robot: state.ore_robot
		clay_robot: state.clay_robot
		obsidian_robot: state.obsidian_robot
		geode_robot: state.geode_robot
	}
}

fn hash_state(state &State) i64 {
	return state.ore + 512 * (state.clay + 512 * (state.obsidian + 512 * (state.geode +
		512 * (state.ore_robot + 32 * (state.clay_robot + 32 * (state.obsidian_robot +
		i64(32) * (state.geode_robot)))))))
}

fn main() {
	mut total_quality := 0
	for line in os.read_lines('input.txt')! {
		blueprint := parse_blueprint(line)?
		mut max_geode := 0
		mut max_min_potential := 0
		mut seen := datatypes.Set[i64]{}
		mut queue := LinkedList[State]{}
		queue.push(State{ ore_robot: 1 })
		for !queue.is_empty() {
			s := queue.shift()!
			if s.geode > max_geode {
				max_geode = s.geode
			}
			if s.minute == 24 {
				continue
			}
			min_potential := s.geode + (24 - s.minute) * s.geode_robot
			if min_potential > max_min_potential {
				max_min_potential = min_potential
			}
			max_potential := min_potential + (23 - s.minute) * (24 - s.minute) / 2
			if max_potential < max_min_potential {
				continue
			}
			if seen.exists(hash_state(s)) {
				continue
			}
			seen.add(hash_state(s))
			if s.ore >= blueprint.geode_robot_ore && s.obsidian >= blueprint.geode_robot_obsidian {
				mut ns := advance_state(s)
				ns.ore -= blueprint.geode_robot_ore
				ns.obsidian -= blueprint.geode_robot_obsidian
				ns.geode_robot++
				queue.push(ns)
			} else {
				if s.ore >= blueprint.obsidian_robot_ore && s.clay >= blueprint.obsidian_robot_clay {
					mut ns := advance_state(s)
					ns.ore -= blueprint.obsidian_robot_ore
					ns.clay -= blueprint.obsidian_robot_clay
					ns.obsidian_robot++
					queue.push(ns)
				}
				if s.ore >= blueprint.clay_robot_ore {
					mut ns := advance_state(s)
					ns.ore -= blueprint.clay_robot_ore
					ns.clay_robot++
					queue.push(ns)
				}
				if s.ore >= blueprint.ore_robot_ore {
					mut ns := advance_state(s)
					ns.ore -= blueprint.ore_robot_ore
					ns.ore_robot++
					queue.push(ns)
				}
				queue.push(advance_state(s))
			}
		}
		total_quality += blueprint.id * max_geode
	}
	println(total_quality)
}
