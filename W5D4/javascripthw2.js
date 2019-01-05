//Callbacks & Titleize

const titleize = function(arr, printCallback) {
    const titledArr = arr.map(function(el) {
        return `Mx. ${el} Jingleheimer Schmidt`;
    });
    printCallback(titledArr);
};

// Commenting out the fn invocation for titleize. In this invocation,
// printCallback is defined as a function that console logs each titleized name
// titleize(["Brian", "David", "Sarah", "Quinn"], (names) => {
//     names.forEach(el => console.log(el));
// });


//Constructors, Protoypes, and this

class Elephant {
    constructor(name, height, tricks) {
        this.name = name;
        this.height = height;
        this.tricks = tricks;
    }

    trumpet() {
        console.log(`${this.name} the elephant goes 'phrRRRRRR!!!!`);
    }

    grow() {
        this.height += 12;
    }

    addTrick(trick) {
        this.tricks.push(trick);
    }

    play() {
        const randomNumber = Math.floor(Math.random() * Math.floor(this.tricks.length));
        console.log(`${this.name} is ${this.tricks[randomNumber]}!`);
    }
}

//Function Invocation

//The following elephant info provided by aA

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

// define helper method for the fn invocation on line 62; forEach is called method-style
// on the herd with paradeHelper taking ele as arg

const paradeHelper = function(oneElephant) {
    console.log(`${oneElephant.name} is trotting by!`);
};

herd.forEach((ele) => paradeHelper(ele));

//Closures

const dinerBreakfast = function() {
    let order = "I'd like french toast please.";
    console.log(order);

    return function (food) {
        order = `${order.slice(0, order.length - 8)} and ${food} please.`;
        console.log(order);
    };
};
