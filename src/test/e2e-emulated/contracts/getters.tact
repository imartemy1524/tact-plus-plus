import "@stdlib/deploy";

struct S {
    a: Int;
    b: Int;
}

message SetIdAndData {
    id: Int;
    data: Cell;
}

contract Test with Deployable {
    id: Int as uint32 = 0;
    anotherData: Cell;

    init() {
        self.anotherData = beginCell().endCell();
    }

    receive(msg: SetIdAndData) {
        self.id = msg.id;
        self.anotherData = msg.data;
    }

    get fun testGetter(): Int {
        return 1;
    }

    get fun test_getter(): Int {
        return 2;
    }

    get fun Test_getter(): Int {
        return 3;
    }

    get fun contractData(): Test {
        return self;
    }

    get fun structAsInput(s: S): S {
        return s;
    }

    get fun contractAsInput(test: Test): Test {
        return test;
    }
}