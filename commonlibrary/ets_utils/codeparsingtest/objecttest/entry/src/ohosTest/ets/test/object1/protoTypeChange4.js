/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export function protoTypeChange4Test() {
    console.log('--- Test Case 1: Assigning to an instance\'s __proto__ ---');

    function Dog(name) {
        this.name = name;
    }
    Dog.prototype.bark = function() {
        console.log(`${this.name} says woof!`);
    };

    const dog1 = new Dog('Buddy');
    const dog2 = new Dog('Max');

    console.log('--- Before modification ---');
    dog1.bark();
    dog2.bark();
    console.log('dog1.__proto__ === Dog.prototype:', dog1.__proto__ === Dog.prototype);

    const catPrototype = {
        meow: function() {
            console.log(`${this.name} says meow!`);
        }
    };

    dog1.__proto__ = catPrototype;

    console.log('\n--- After modifying dog1\'s __proto__ ---');

    dog1.meow();
    try {
        dog1.bark();
    } catch (e) {
        console.log('dog1.bark() failed:', e.message);
    }

    dog2.bark();
    console.log('dog2.__proto__ === Dog.prototype:', dog2.__proto__ === Dog.prototype);

    const dog3 = new Dog('Charlie');
    dog3.bark();
    return true;
}

export function protoTypeChange4Test1() {
    console.log('\n--- Test Case 2: Assigning to a constructor\'s prototype ---');

    function Cat(name) {
        this.name = name;
    }
    Cat.prototype.meow = function() {
        console.log(`${this.name} says old meow!`);
    };

    const oldCat = new Cat('Whiskers');
    oldCat.meow();

    Cat.prototype = {
        purr: function() {
            console.log(`${this.name} is purring!`);
        },
        meow: function() {
            console.log(`${this.name} says new meow!`);
        }
    };

    console.log('--- After replacing Cat.prototype ---');

    oldCat.meow();
    try {
        oldCat.purr();
    } catch (e) {
        console.log('oldCat.purr() failed:', e.message);
    }

    const newCat = new Cat('Luna');
    newCat.meow();
    newCat.purr();

    return [oldCat instanceof Cat, newCat instanceof Cat];
}

export function protoTypeChange4Test2() {
    console.log('\n--- Test Case 3: Assigning to a constructor\'s __proto__ ---');
    let result = [];

    function Animal(legs) {
        this.legs = legs;
    }
    Animal.isAnimal = function() {
        return true;
    };

    function Bird(legs) {
        Animal.call(this, legs);
    }

    console.log('--- Before modification ---');
    result.push(typeof Bird.isAnimal);

    Bird.__proto__ = Animal;

    console.log('\n--- After modifying Bird\'s __proto__ ---');

    result.push(Bird.isAnimal());

    const sparrow = new Bird(2);
    result.push(sparrow.legs);
    result.push(sparrow.__proto__ === Bird.prototype);
    result.push(sparrow instanceof Animal);
    return result;
}

export function protoTypeChange4Test3() {
    console.log('--- Test Case 4: Cross-type __proto__ assignment between instances ---');

    const myArray = [1, 2, 3];
    const myObject = {
        greet: () => console.log('Hello from object!')
    };
    let result = [];

    console.log('--- Before prototype change ---');
    result.push(Array.isArray(myArray));
    result.push(myArray.includes(2));

    myArray.__proto__ = myObject;

    console.log('\n--- After prototype change ---');

    result.push(Array.isArray(myArray));
    try {
        result.push(myArray.includes(2));
    } catch (e) {
        console.log('myArray.includes() failed:', e.message);
    }

    myArray.greet();

    myObject.newProp = 'I am new';
    result.push(myArray.newProp);
    return result;
}

export function protoTypeChange4Test4() {
    console.log('\n--- Test Case 5: Assigning to a built-in constructor\'s prototype ---');

    const originalArrayIncludes = Array.prototype.includes;

    console.log('Adding "customMethod" to Array.prototype...');
    Array.prototype.customMethod = function() {
        return `This array has ${this.length} elements.`;
    };
    let result = [];

    const arr1 = [1, 2, 3];
    const arr2 = new Array(5);
    result.push(arr1.customMethod());
    result.push(arr2.customMethod());

    console.log('Overriding "includes" method on Array.prototype...');
    Array.prototype.includes = function(value) {
        return `Fake includes: I don't know if ${value} is present.`;
    };

    result.push(arr1.includes(2));

    console.log('Restoring original "includes" method...');
    Array.prototype.includes = originalArrayIncludes;
    result.push(arr1.includes(2));
    return result;
}

export function protoTypeChange4Test5() {
    console.log('\n--- Test Case 6: Assigning to a built-in object instance\'s __proto__ ---');
    let result = [];
    console.log('Math is an object:', typeof Math === 'object');
    result.push(Math.hasOwnProperty('PI'));
    const myMathExtensions = {
        double: (x) => x * 2,
        PI: 3.14
    };

    Math.__proto__ = myMathExtensions;

    result.push(Math.double(5));
    result.push(Math.PI);
    result.push(typeof JSON.double);
    return result;
}

export function protoTypeChange4Test6() {
    console.log('\n--- Test Case 7: Trying to access __proto__ on null and undefined ---');
    let result = [];

    try {
        console.log(null.__proto__);
    } catch (e) {
        result.push(e.name + e.message);
    }

    try {
        console.log(undefined.__proto__);
    } catch (e) {
        result.push(e.name + e.message);
    }
    return result;
}

export function protoTypeChange4Test7() {
    console.log('--- Test Case 8: Using Symbol as a key for prototype/__proto__ ---');

    const sym = Symbol('my_proto');

    const obj = {};
    try {
        obj[sym] = {};
        console.log(`obj[sym] = {} is allowed. Value:`, obj[sym]);

        obj.__proto__ = obj[sym];
        console.log(`obj.__proto__ = obj[sym] is allowed. obj's prototype is now:`, obj.__proto__);

        obj[sym].testProp = 'Hello';
        console.log('obj.testProp:', obj.testProp);
    } catch (e) {
        console.error('Error using Symbol as prototype key:', e.message);
    }

    console.log('\n--- Key Insight ---');
    console.log('`prototype` and `__proto__` refer to specific internal slots. Using a Symbol as a key creates a regular property, not a new prototype chain.');
    return true;
}

export function protoTypeChange4Test8() {
    console.log('\n--- Test Case 9: Proxy interception of prototype assignments ---');

    const target = {};

    const handler = {
        set: function(target, prop, value, receiver) {
            console.log(`Proxy SET trap: Setting property '${prop}' to`, value);
            if (prop === '__proto__') {
                Reflect.setPrototypeOf(target, value);
                return true;
            }
            if (prop === 'prototype') {
                console.log('Proxy SET trap: Blocking modification of \'prototype\' property.');
                return true;
            }
            target[prop] = value;
            return true;
        }
    };

    const proxy = new Proxy(target, handler);

    console.log('\n--- Trying to set proxy.__proto__ ---');
    const newProto = {
        foo: 'bar'
    };
    proxy.__proto__ = newProto;
    console.log('After setting, proxy.foo:', proxy.foo);

    console.log('\n--- Trying to set proxy.prototype ---');
    proxy.prototype = {
        bar: 'baz'
    };
    console.log('After setting, proxy.prototype:', proxy.prototype);

    console.log('\n--- Directly modifying a function\'s prototype ---');
    function MyFunc() {}
    MyFunc.prototype = {
        newMethod: () => {}
    };
    console.log('MyFunc.prototype after modification:', MyFunc.prototype);
    return true;
}

export function protoTypeChange4Test9() {
    console.log('\n--- Test Case 10: Class interaction with prototype/__proto__ assignment ---');

    class MyClass {
        constructor(name) {
            this.name = name;
        }
        originalMethod() {
            console.log(`Original method from ${this.name}`);
        }
    }

    const instance = new MyClass('Instance 1');
    instance.originalMethod();

    console.log('\n--- Modifying MyClass.prototype ---');
    MyClass.prototype.newMethod = function() {
        console.log(`New method from ${this.name}`);
    };
    const newInstance = new MyClass('Instance 2');
    newInstance.originalMethod();
    newInstance.newMethod();
    instance.newMethod();

    console.log('\n--- Modifying instance\'s __proto__ ---');
    const otherProto = {
        overriddenMethod: function() {
            console.log(`Overridden method from ${this.name}`);
        }
    };
    instance.__proto__ = otherProto;
    instance.overriddenMethod();
    try {
        instance.originalMethod();
    } catch (e) {
        console.log('instance.originalMethod() failed:', e.message);
    }

    console.log('\n--- Modifying MyClass\'s __proto__ ---');
    const staticMethods = {
        staticMethod: () => console.log('This is a static method')
    };
    MyClass.__proto__ = staticMethods;
    MyClass.staticMethod();
    return true;
}

export function protoTypeChange4Test10() {
    console.log('\n--- Test Case 11: Objects with null prototype ---');

    const dict = Object.create(null);
    console.log('dict is an object:', typeof dict === 'object');
    console.log('dict has no prototype:', Object.getPrototypeOf(dict) === null);

    console.log('dict.__proto__:', dict.__proto__);

    console.log('Assigning dict.__proto__ = { foo: "bar" }');
    dict.__proto__ = {
        foo: 'bar'
    };
    console.log('dict.__proto__ after assignment:', dict.__proto__);
    console.log('dict.foo:', dict.foo);
    console.log('Object.getPrototypeOf(dict) is still:', Object.getPrototypeOf(dict));

    console.log('dict has no hasOwnProperty method:', typeof dict.hasOwnProperty);
    return true;
}

export function protoTypeChange4Test11() {
    console.log('--- Test Case 12: Modifying Function.prototype ---');

    const originalApply = Function.prototype.apply;

    function add(a, b) {
        return a + b;
    }
    console.log('Before modification: add(2, 3) =', add(2, 3));

    Function.prototype.apply = function(context, args) {
        return -1;
    };

    console.log('\n--- After modifying Function.prototype.apply ---');

    console.log('add.apply(null, [2, 3]) =', add.apply(null, [2, 3]));

    const arr = [1, 2, 3];
    const mapped = arr.map(v => v * 2);
    console.log('arr.map(v => v*2) =', mapped);

    Function.prototype.apply = originalApply;
    console.log('\n--- After restoring original apply ---');
    console.log('add.apply(null, [2, 3]) =', add.apply(null, [2, 3]));
    console.log('arr.map(v => v*2) =', arr.map(v => v * 2));
    return true;
}

export function protoTypeChange4Test12() {
    console.log('\n--- Test Case 13: Assigning Array.prototype to a plain object ---');

    const arr = [1, 2, 3];
    console.log('Before modification: arr.includes(2) =', arr.includes(2));
    console.log('Before modification: arr.push(4) → arr =', (arr.push(4), arr));

    Array.prototype.customMethod = function() {
        return `Custom: ${this.join(',')}`;
    };

    Array.prototype.join = function(sep = ',') {
        return this.reduce((a, b) => `${a}${sep}${b}`, '');
    };

    console.log('\n--- After replacing Array.prototype ---');

    const newArr = [5, 6, 7];
    console.log('newArr.customMethod() =', newArr.customMethod());
    try {
        console.log('newArr.includes(6) =', newArr.includes(6));
    } catch (e) {
        console.error('newArr.includes failed:', e.message);
    }
    try {
        newArr.push(8);
    } catch (e) {
        console.error('newArr.push failed:', e.message);
    }

    try {
        arr.push(5);
    } catch (e) {
        console.error('arr.push failed (existing array):', e.message);
    }

    console.log('\n--- After restoring original Array.prototype ---');
    console.log('arr.push(5) → arr =', (arr.push(5), arr));
    return true;
}

export function protoTypeChange4Test13() {
    console.log('\n--- Test Case 14: this binding mismatch after prototype change ---');

    const str = 'hello';
    const num = 123;

    const originalStringProto = String.prototype;
    // String.prototype = Number.prototype;

    console.log('--- After String.prototype = Number.prototype ---');

    try {
        console.log('str.toFixed(2) =', str.toFixed(2));
    } catch (e) {
        console.log('str.toFixed failed:', e.message);
    }

    // String.prototype = originalStringProto;
    const originalNumberProto = Number.prototype;
    // Number.prototype = String.prototype;

    console.log('\n--- After Number.prototype = String.prototype ---');
    try {
        console.log('num.includes(2) =', num.includes(2));
    } catch (e) {
        console.log('num.includes failed:', e.message);
    }

    // Number.prototype = originalNumberProto;
    return true;
}

export function protoTypeChange4Test14() {
    console.log('\n--- Test Case 15: Assigning Object.prototype to null ---');

    const originalObjectProto = Object.prototype;

    const obj = {
        a: 1,
        b: 2
    };
    let result = [];
    result.push(obj.toString());
    result.push(Object.keys(obj));

    // Object.prototype = null;

    console.log('\n--- After Object.prototype = null ---');

    try {
        result.push(obj.toString());
    } catch (e) {
        console.error('obj.toString failed:', e.message);
    }

    try {
        result.push(Object.keys(obj));
    } catch (e) {
        console.error('Object.keys failed:', e.message);
    }

    // Object.prototype = originalObjectProto;
    console.log('\n--- After restoring original Object.prototype ---');
    result.push(obj.toString());
    return result;
}

export function protoTypeChange4Test15() {
    console.log('--- Test Case 16: Class extends and prototype assignment ---');

    class Parent {
        parentMethod() {
            console.log('This is from Parent');
        }
    }

    class Child extends Parent {
        childMethod() {
            console.log('This is from Child');
        }
    }

    const childInstance = new Child();

    console.log('--- Before prototype modification ---');
    childInstance.parentMethod();
    childInstance.childMethod();

    console.log('\n--- Modifying Parent.prototype ---');
    Parent.prototype.newParentMethod = function() {
        console.log('This is a new method from Parent');
    };
    childInstance.newParentMethod();

    console.log('\n--- Modifying Child.prototype ---');
    Child.prototype.newChildMethod = function() {
        console.log('This is a new method from Child');
    };
    childInstance.newChildMethod();

    console.log('\n--- Replacing Child.prototype ---');
    const originalChildPrototype = Child.prototype;
    // Child.prototype = {
    //     overriddenMethod: function() {
    //         console.log('Child prototype has been overridden');
    //     }
    // };
    const newChildInstance = new Child();
    newChildInstance.childMethod();
    try {
        newChildInstance.parentMethod();
    } catch (e) {
        console.error('newChildInstance.parentMethod() failed:', e.message);
    }

    // Child.prototype = originalChildPrototype;
    return true;
}

export function protoTypeChange4Test16() {
    console.log('\n--- Test Case 17: Private fields and prototype manipulation ---');

    class MyClass {
        #privateField = 'I am private';

        getPrivate() {
            return this.#privateField;
        }

        setPrivate(value) {
            this.#privateField = value;
        }
    }
    let result = [];

    const instance = new MyClass();
    result.push(instance.getPrivate());

    const attackerProto = {
        stealPrivate: function() {
            try {
                return this.getPrivate();
            } catch (e) {
                return `Failed to steal: ${e.message}`;
            }
        }
    };
    instance.__proto__ = attackerProto;
    result.push(instance.stealPrivate());

    try {
        MyClass.prototype.stealPrivateFromPrototype = function() {
            return this.getPrivate();
        };
        result.push(instance.stealPrivateFromPrototype());
    } catch (e) {
        result.push(e.message);
    }
    return result;
}

export function protoTypeChange4Test17() {
    console.log('\n--- Test Case 18: Defending against prototype pollution ---');

    const userInput = JSON.parse('{"__proto__": {"isAdmin": true}}');
    let result = [];

    console.log('--- Scenario 1: Using a normal object (VULNERABLE) ---');
    const config = {};
    result.push(config.isAdmin);
    result.push(({}).isAdmin);
    function merge(target, source) {
        for (const key in source) {
            if (typeof source[key] === 'object' && source[key] !== null) {
                if (!target[key]) target[key] = {};
                merge(target[key], source[key]);
            } else {
                target[key] = source[key];
            }
        }
        return target;
    }

    merge(config, userInput);

    result.push(config.isAdmin);
    result.push(({}).isAdmin);
    result.push(new Object().isAdmin);

    delete Object.prototype.isAdmin;
    result.push(({}).isAdmin);


    console.log('\n--- Scenario 2: Using Object.create(null) (SAFE) ---');
    const safeConfig = Object.create(null);
    result.push(safeConfig.isAdmin);

    merge(safeConfig, userInput);

    result.push(safeConfig.isAdmin);
    result.push(({}).isAdmin);
    return result;
}
export function protoTypeChange4Test18() {
    console.log('--- Test Case 19: Infinite prototype chain ---');

    const obj = {};
    let result = [];
    try {
        Object.setPrototypeOf(obj, obj);

        result.push(Object.getPrototypeOf(obj) === obj);
        console.log('--- Attempting to access a non-existent property (will cause stack overflow) ---');
        result.push(obj.noSuchProp);
    } catch (e) {
        console.log('Error accessing property:', e.name, e.message);
    }

    console.log('--- Testing instanceof ---');
    try {
        result.push(obj instanceof Object);
    } catch (e) {
        console.error('Error in instanceof check:', e.name, e.message);
    }
    return result;
}

export function protoTypeChange4Test19() {
    console.log('\n--- Test Case 21: Prototype modification in asynchronous code ---');

    const myObject = { value: 42 };
    let result = [];

    console.log('--- Before any async operations ---');
    result.push(myObject.value);
    function asyncPrototypeModifier() {
        return new Promise((resolve) => {
            setTimeout(() => {
                console.log('\n--- Inside setTimeout: Modifying prototype ---');
                const newProto = {
                    getValue: function() { return this.value; },
                    doubleValue: function() { return this.value * 2; }
                };
                Object.setPrototypeOf(myObject, newProto);
                resolve();
            }, 100);
        });
    }

    const modificationPromise = asyncPrototypeModifier();

    console.log('\n--- After initiating async modification (but before it completes) ---');
    result.push(typeof myObject.getValue === 'undefined');

    modificationPromise.then(() => {
        console.log('\n--- After async modification promise resolves ---');
        result.push(myObject.getValue());
        result.push(myObject.doubleValue());
    });

    setTimeout(() => {
        console.log('\n--- Final check in another timeout ---');
        result.push(myObject.getValue());
    }, 200);
    return result;
}

export function protoTypeChange4Test20() {
    console.log('--- Test Case 22: Prototype of Arrow Functions ---');

    const myArrowFunc = () => { console.log('I am an arrow function'); };

    console.log('myArrowFunc.prototype:', myArrowFunc.prototype);

    try {
        const instance = new myArrowFunc();
    } catch (e) {
        console.log('Error creating instance with new myArrowFunc():', e.name, e.message);
    }

    function myRegularFunc() {}
    console.log('myRegularFunc.prototype:', myRegularFunc.prototype);
    return true;
}

export function protoTypeChange4Test21() {
    console.log('\n--- Test Case 23: Prototype of Generator Functions ---');

    function* myGenerator() {
        yield 1;
        yield 2;
        yield 3;
    }

    console.log('myGenerator.prototype:', myGenerator.prototype);
    console.log('myGenerator.prototype.next:', typeof myGenerator.prototype.next);

    const generatorInstance = myGenerator();
    console.log('generatorInstance is an object:', typeof generatorInstance === 'object');

    console.log('Object.getPrototypeOf(generatorInstance) === myGenerator.prototype:',
        Object.getPrototypeOf(generatorInstance) === myGenerator.prototype);

    myGenerator.prototype.customMethod = function() {
        return `Current value is ${this.next().value}`;
    };

    const anotherInstance = myGenerator();
    return [anotherInstance.customMethod(), anotherInstance.customMethod()];
}

export function protoTypeChange4Test22() {
    console.log('\n--- Test Case 24: Symbol.unscopables ---');
    let result = [];

    const myObject = {
        a: 1,
        b: 2,
        [Symbol.unscopables]: {
            b: true,
            c: true
        }
    };

    let a = 10;
    let b = 20;
    let c = 30;

    // with (myObject) {
    //     console.log('\nInside with:');
    //     console.log('a:', a);
    //     console.log('b:', b);
    //     console.log('c:', c);
    // }

    console.log('\nOutside with again - a:', a);
    return true;
}

export function protoTypeChange4Test23() {
    console.log('--- Test Case 25: Prototype vs. Combination Inheritance ---');

    function Parent() {
        this.instanceProp = 'I am instance-specific';
    }
    let result = [];
    Parent.prototype.sharedArray = [];

    function ChildPrototypeOnly() {}
    ChildPrototypeOnly.prototype = new Parent();
    ChildPrototypeOnly.prototype.constructor = ChildPrototypeOnly;

    console.log('--- Testing Prototype-Only Inheritance ---');
    const child1 = new ChildPrototypeOnly();
    const child2 = new ChildPrototypeOnly();

    child1.sharedArray.push('value from child1');
    result.push(child1.sharedArray);
    result.push(child2.sharedArray);
    function ChildCombination(name) {
        Parent.call(this);
        this.name = name;
    }
    ChildCombination.prototype = new Parent();
    ChildCombination.prototype.constructor = ChildCombination;

    console.log('\n--- Testing Combination Inheritance ---');
    const child3 = new ChildCombination('Alice');
    const child4 = new ChildCombination('Bob');

    child3.sharedArray.push('value from child3');
    result.push(child3.sharedArray);
    result.push(child4.sharedArray);

    function ChildParasiticCombination(name) {
        Parent.call(this);
        this.name = name;
    }
    ChildParasiticCombination.prototype = Object.create(Parent.prototype);
    ChildParasiticCombination.prototype.constructor = ChildParasiticCombination;

    console.log('\n--- Testing Parasitic Combination Inheritance (Best Practice) ---');
    const child5 = new ChildParasiticCombination('Charlie');
    const child6 = new ChildParasiticCombination('David');

    child5.sharedArray.push('value from child5');
    result.push(child5.sharedArray);
    result.push(child6.sharedArray);
    return result;
}

export function protoTypeChange4Test24() {
    console.log('\n--- Test Case 26: Object.create Edge Cases ---');
    let result = [];
    try {
        const obj1 = Object.create(123);
        result.push(Object.getPrototypeOf(obj1));
    } catch (e) {
        result.push(e.message);
    }

    const obj2 = Object.create(null);
    result.push(Object.getPrototypeOf(obj2));
    result.push(obj2.toString);

    function MyClass() {}
    MyClass.prototype.myMethod = function() { console.log('Hello from MyClass'); };

    const obj3 = Object.create(MyClass.prototype);
    result.push(obj3 instanceof MyClass);
    obj3.myMethod();
    result.push(obj3.hasOwnProperty('constructor'));
    return result;
}

export function protoTypeChange4Test25() {
    console.log('\n--- Test Case 27: Prototype Performance in Hot Loops ---');

    const level3 = { getValue: () => 1 };
    const level2 = Object.create(level3);
    const level1 = Object.create(level2);
    const obj = Object.create(level1);

    obj.getOwnValue = () => 1;

    const iterations = 10_0;

    console.time('Access own property');
    for (let i = 0; i < iterations; i++) {
        obj.getOwnValue();
    }
    console.timeEnd('Access own property');

    console.time('Access deep prototype property');
    for (let i = 0; i < iterations; i++) {
        obj.getValue();
    }
    console.timeEnd('Access deep prototype property');

    console.time('Access non-existent property');
    for (let i = 0; i < iterations; i++) {
        obj.noSuchMethod;
    }
    console.timeEnd('Access non-existent property');
    return true;
}

export function protoTypeChange4Test26() {
    console.log('--- Test Case 28: Static Methods and Prototype ---');

    class MyStaticClass {
        static staticMethod() {
            console.log('This is a static method.');
        }

        instanceMethod() {
            console.log('This is an instance method.');
        }
    }

    console.log('MyStaticClass.staticMethod:', MyStaticClass.staticMethod);
    console.log('MyStaticClass.prototype.staticMethod:', MyStaticClass.prototype.staticMethod);

    console.log('MyStaticClass.prototype.instanceMethod:', MyStaticClass.prototype.instanceMethod);

    MyStaticClass.staticMethod();

    const instance = new MyStaticClass();
    instance.instanceMethod();

    try {
        instance.staticMethod();
    } catch (e) {
        console.log('instance.staticMethod() failed:', e.message);
    }

    console.log('MyStaticClass.hasOwnProperty(\'staticMethod\'):', MyStaticClass.hasOwnProperty('staticMethod'));
    return true;
}

export function protoTypeChange4Test27() {
    console.log('\n--- Test Case 29: Proxy construct Trap and Prototype ---');

    function TargetConstructor(name) {
        this.name = name;
        console.log(`TargetConstructor called with name: ${name}`);
    }
    TargetConstructor.prototype.sayHello = function() {
        console.log(`Hello, my name is ${this.name}`);
    };

    const alternativePrototype = {
        sayGoodbye: function() {
            console.log(`Goodbye from ${this.name}`);
        }
    };

    const proxy = new Proxy(TargetConstructor, {
        construct: function(target, argumentsList, newTarget) {
            console.log('\n--- Proxy construct trap triggered ---');
            console.log('Target:', target.name);
            console.log('Arguments:', argumentsList);

            const instance = new target(...argumentsList);

            Object.setPrototypeOf(instance, alternativePrototype);

            console.log('--- Exiting construct trap ---');
            return instance;
        }
    });

    const instance = new proxy('Alice');

    console.log('\n--- Verifying the instance ---');
    console.log('instance.name:', instance.name);

    instance.sayGoodbye();

    try {
        instance.sayHello();
    } catch (e) {
        console.log('instance.sayHello() failed:', e.message);
    }

    return [instance instanceof TargetConstructor, instance instanceof proxy];
}

export function protoTypeChange4Test28() {
    console.log('\n--- Test Case 30: Reflect.construct and Prototype Control ---');

    function Person(name) {
        this.name = name;
    }
    Person.prototype.speak = function() {
        console.log(`${this.name} is speaking.`);
    };

    const alienPrototype = {
        fly: function() {
            console.log(`${this.name} is flying.`);
        }
    };
    let result = [];

    const person = new Person('Bob');
    person.speak();
    result.push(Object.getPrototypeOf(person));
    function Alien() {}

    Alien.prototype = alienPrototype;
    const alien = Reflect.construct(Person, ['Zog'], Alien);

    result.push(alien.name);
    alien.fly();

    try {
        alien.speak();
    } catch (e) {
        result.push(e.message);
    }

    result.push(Object.getPrototypeOf(alien));
    return result;
}

export function protoTypeChange4Test29() {
    console.log('--- Test Case 31: Prototype Mutation and Hidden Class Optimization ---');

    const objectsA = Array.from({ length: 1000 }, () => ({ value: 42 }));

    const objectsB = Array.from({ length: 1000 }, () => ({ value: 42 }));
    Object.setPrototypeOf(objectsB[0], { customMethod: () => {} });

    const iterations = 500_0;

    console.time('Accessing properties with uniform shape');
    for (let i = 0; i < iterations; i++) {
        const v = objectsA[i % 1000].value;
        if (v !== 42) console.error('Unexpected value');
    }
    console.timeEnd('Accessing properties with uniform shape');

    console.time('Accessing properties with mutated prototype (polymorphic)');
    for (let i = 0; i < iterations; i++) {
        const v = objectsB[i % 1000].value;
        if (v !== 42) console.error('Unexpected value');
    }
    return true;
}

export function protoTypeChange4Test30() {
    console.log('\n--- Test Case 32: Object.hasOwn() and the Prototype Chain ---');

    const proto = { inheritedProp: 'I am inherited' };
    const obj = Object.create(proto);
    obj.ownProp = 'I am own';
    let result = [];

    result.push('ownProp' in obj);
    result.push('inheritedProp' in obj);

    result.push(obj.hasOwnProperty('ownProp'));
    result.push(obj.hasOwnProperty('inheritedProp'));

    result.push(Object.hasOwn(obj, 'ownProp'));
    result.push(Object.hasOwn(obj, 'inheritedProp'));

    const badObj = {
        hasOwnProperty: () => false,
        realProp: 123
    };
    result.push(badObj.hasOwnProperty('realProp'));
    result.push(Object.hasOwn(badObj, 'realProp'));
    return result;
}

export function protoTypeChange4Test31() {
    console.log('\n--- Test Case 33: WeakMap as a Prototype Alternative ---');

    const privateData = new WeakMap();

    class SecureStore {
        constructor(id, secret) {
            privateData.set(this, { id, secret });
        }

        getId() {
            return privateData.get(this).id;
        }

        getSecret() {
            return privateData.get(this).secret;
        }
    }

    const store1 = new SecureStore('user-123', 'my-secret-password');
    const store2 = new SecureStore('user-456', 'another-secret');
    let result = [];

    result.push(store1.getId());
    result.push(store1.getSecret());

    console.log('store1 has own property "id"?', Object.hasOwn(store1, 'id'));
    console.log('store1\'s prototype:', Object.getPrototypeOf(store1));
    console.log('Can we access the secret directly?', store1.secret);
    result.push(Object.hasOwn(store1, 'id'));
    result.push(store1.secret);
    return result
}
