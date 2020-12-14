struct Brick {
    var x, y, z : Int
}

struct Hole {
    var x, y : Int

    func isFit(_ brick : Brick) -> Bool {
        return fitSide(brick.x, brick.y) || fitSide(brick.x, brick.z) || fitSide(brick.y, brick.z)
    }

    func fitSide(_ x : Int, _ y : Int) -> Bool {
        return (self.x >= x && self.y >= y) || (self.x >= y && self.y >= x)
    }
}

var brick = Brick(x : 1, y : 2, z : 1)
var hole = Hole(x : 1, y : 2)
print(hole.isFit(brick))

brick = Brick(x : 1, y : 3, z : 4)
print(hole.isFit(brick))