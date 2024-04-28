const std = @import("std");

const Node = struct {
    data: i32,
    next: ?*Node,
};

fn createList(values: []const i32) ?*Node {
    var head: ?*Node = null;
    var current: ?*Node = null;

    for (values) |v| {
        const node = Node{ .data = v, .next = null };
        if (head == null) {
            head = &node;
            current = head;
        } else {
            current.?.next = &node;
            current = &node;
        }
    }
    return head;
}

fn printList(head: ?*Node) void {
    var current = head;
    while (current) |node| {
        std.debug.print("{} -> ", .{node.data});
        current = node.next;
    }
    std.debug.print("null\n", .{});
}

pub fn main() !void {
    const values = [_]i32{ 1, 2, 3, 4, 5 };
    const head = createList(values[0..]) orelse return;
    printList(head);
}
