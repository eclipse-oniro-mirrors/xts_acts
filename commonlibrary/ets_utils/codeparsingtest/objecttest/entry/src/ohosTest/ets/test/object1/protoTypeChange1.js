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

class C6{
    p(a8, a9){
        function f10(){
            return 981205344;
        }
        return f10;
    }
    static 166 = 536870887;
    #f;
    #g;
    #b = -23682;
    hasPrivateB() {
        return #b in this;
    }

    getPrivateB() {
        return this.#b;
    }
}
class C27 extends null {}
export function protoTypeChange1Test() {
    ~C6[166];
    const v13 = new C6();
    try {
        const t15 = v13.constructor;
        new t15();
    } catch (e16) {
    }
    try {
        const v17 = v13.constructor;
        try {
            new v17();
        } catch (e19) {
        }
        const v20 = new v17();
        try {
            v20.p(C6, 536870887);
        } catch (e22) {
        }
    } catch (e23) {
    }
    new C6();
    new C6();
    const v28 = C27.prototype;
    v28.f = v28;
    try {
        new C27();
    } catch (e30) {
    }
    return true;
}
export function protoTypeChange1Test1() {
    const instanceC6 = new C6();

    console.log('--- Testing C6 private fields ---');
    console.log('instanceC6 has #b?', instanceC6.hasOwnProperty('#b'));

    console.log('--- Testing C6 method p ---');
    const returnedFunction = instanceC6.p('arg1', 'arg2');
    return [typeof returnedFunction === 'function', returnedFunction()];
}

export function protoTypeChange1Test2() {
    console.log('--- Testing C27 prototype chain ---');
    let result = [];

    result.push(Object.getPrototypeOf(C27.prototype));
    result.push(C27.__proto__ === Function.prototype);

    console.log('--- Attempting to instantiate C27 ---');
    try {
        const instanceC27 = new C27();
    } catch (e) {
        console.log('Error creating new C27():', e.name, e.message);
        result.push(e.name + e.message);
    }
    return result;
}

export function protoTypeChange1Test3() {
    console.log('--- Testing C27.prototype circular reference ---');

    const c27Proto = C27.prototype;
    return c27Proto.f === c27Proto;
}

export function protoTypeChange1Test4() {
    console.log('--- Creating a prototype-less object correctly ---');

    const trulyEmptyObject = Object.create(null);
    let result = [];

    result.push(trulyEmptyObject.__proto__);
    result.push(Object.getPrototypeOf(trulyEmptyObject));
    result.push(trulyEmptyObject.toString);

    trulyEmptyObject.key = 'value';
    result.push(trulyEmptyObject.key);
    return result;
}

export function protoTypeChange1Test5() {
    console.log('--- Testing C6 static fields ---');
    let result = [];
    result.push(C6[166]);
    result.push(C6.hasOwnProperty(166));
    result.push(Object.getOwnPropertyNames(C6));
    return result;
}

export function protoTypeChange1Test6() {
    const instanceC6 = new C6();

    console.log('--- Testing C6 instance property descriptors ---');
    let result = [];

    result.push(Object.keys(instanceC6));
    result.push(Object.getOwnPropertyNames(instanceC6));

    try {
        const descriptor = Object.getOwnPropertyDescriptor(instanceC6, '#b');
        result.push(descriptor);
    } catch (e) {
        console.log('Error getting descriptor for #b:', e.name, e.message);
        result.push(e.name + e.message);
    }
    return result;
}

export function protoTypeChange1Test7() {
    const instanceC6 = new C6();
    let result = [];

    result.push(instanceC6.constructor === C6);
    result.push(instanceC6 instanceof C6);
    result.push(instanceC6 instanceof Object);
    return result;
}

export function protoTypeChange1Test8() {
    console.log('--- Testing C27 class itself ---');
    class C28 {}
    const instance = new C28();
    Object.setPrototypeOf(instance, null);
    let result = [];
    result.push(typeof C28);
    result.push(C28.prototype);
    result.push(Object.getPrototypeOf(C28) === Function.prototype);
    result.push(C28 instanceof Function);
    result.push(C28 instanceof Object);
    return result;
}

export function protoTypeChange1Test9() {
    class C6Child extends C6 {
        constructor() {
            super();
        }

        getParentPrivateFieldIndirectly() {
            return 'Cannot access parent private field directly';
        }
    }

    console.log('--- Testing C6Child ---');

    const childInstance = new C6Child();
    let result = [];
    result.push(childInstance instanceof C6);
    result.push(typeof childInstance.p === 'function');
    result.push(childInstance.getParentPrivateFieldIndirectly());
    return result;
}

export function protoTypeChange1Test10() {
    const instanceC6 = new C6();

    const c6Proxy = new Proxy(instanceC6, {
        get(target, prop, receiver) {
            console.log(`Proxy GET trap: trying to access '${prop}'`);
            return Reflect.get(target, prop, receiver);
        }
    });

    return [c6Proxy.p()()];
}

export function protoTypeChange1Test11() {
    console.log('--- Testing Object.create with C27.prototype ---');

    const objFromC27Proto = Object.create(C27.prototype);
    let result = [];

    result.push(Object.getPrototypeOf(objFromC27Proto) === C27.prototype);
    result.push(Object.getPrototypeOf(objFromC27Proto.f));
    result.push(objFromC27Proto instanceof C27);
    return result;
}

export function protoTypeChange1Test12() {
    console.log('--- Discussion: Performance and Memory ---');

    const instanceC6 = new C6();
    const f1 = instanceC6.p();
    const f2 = instanceC6.p();
    return f1 === f2;
}

export function protoTypeChange1Test13() {
    const instanceC6 = new C6();

    console.log('--- Testing `this` binding in C6 methods ---');

    const f10_from_instance = instanceC6.p();
    let result = [];
    result.push(f10_from_instance());

    const anotherObject = { some: 'object' };
    const p_bound_to_another = instanceC6.p.call(anotherObject, 'argA', 'argB');
    result.push(p_bound_to_another());

    const p_function = instanceC6.p;
    try {
        const f10_from_lost_this = p_function();
        result.push(f10_from_lost_this());
    } catch (e) {
        result.push(e.message);
    }
    return result;
}

export function protoTypeChange1Test14() {
    C6.staticMethod = function() {
        return 'This is a static method from C6';
    };

    C6.prototype.instanceMethod = function() {
        return 'This is an instance method from C6.prototype';
    };

    class C6GrandChild extends C6 {
    }

    console.log('--- Testing inheritance of methods ---');

    const grandChildInstance = new C6GrandChild();
    let result = [];

    result.push(grandChildInstance.instanceMethod());
    result.push(C6GrandChild.staticMethod());
    result.push(grandChildInstance.instanceMethod === C6.prototype.instanceMethod);
    result.push(C6GrandChild.staticMethod === C6.staticMethod);
    return result;
}

export function protoTypeChange1Test15() {
    class C6WithSuper extends C6 {
        instanceMethod() {
            const parentResult = super.instanceMethod();
            return `${parentResult} (and this is from the child)`;
        }

        static staticMethod() {
            const parentResult = super.staticMethod();
            return `${parentResult} (and this is from the child static)`;
        }
    }

    console.log('--- Testing `super` in child class ---');

    const superChildInstance = new C6WithSuper();
    let result = [];

    result.push(superChildInstance.instanceMethod());
    result.push(C6WithSuper.staticMethod());
    return result;
}

export function protoTypeChange1Test16() {
    const objFromC27Proto = Object.create(C27.prototype);
    let result = [];

    console.log('--- Testing the end of C27\'s prototype chain ---');
    result.push(objFromC27Proto.toString);
    result.push(objFromC27Proto.hasOwnProperty);

    const objString = Object.prototype.toString.call(objFromC27Proto);
    result.push(objString);

    const hasF = Object.prototype.hasOwnProperty.call(objFromC27Proto, 'f');
    result.push(hasF);
    return result;
}

export function protoTypeChange1Test17() {
    const C6Proxy = new Proxy(C6, {
        construct(target, args, newTarget) {
            console.log(`--- Proxy CONSTRUCT trap: Creating a new instance of ${target.name} ---`);
            console.log('Constructor arguments:', args);

            const instance = Reflect.construct(target, args, newTarget);

            console.log('Instance created:', instance);
            console.log('--- CONSTRUCT trap finished ---');

            return instance;
        }
    });

    console.log('--- Testing Proxy for C6 class ---');

    const instanceFromProxy = new C6Proxy();

    return [instanceFromProxy instanceof C6, instanceFromProxy instanceof C6Proxy];
}

export function protoTypeChange1Test18() {
    const instanceC6 = new C6();

    const instanceProxy = new Proxy(instanceC6, {
        get(target, prop, receiver) {
            const value = Reflect.get(target, prop, receiver);

            if (typeof value === 'function' && prop !== 'constructor') {
                return function(...args) {
                    console.log(`--- Proxy GET trap: Calling method '${prop}' ---`);
                    console.log('Method arguments:', args);

                    const result = value.apply(this, args);

                    console.log(`Method '${prop}' returned:`, result);
                    console.log('--- Method call finished ---');
                    return result;
                };
            }

            return value;
        }
    });

    console.log('--- Testing Proxy for C6 instance methods ---');

    const returnedFunc = instanceProxy.p('arg1', 'arg2');
    const finalResult = returnedFunc();

    return finalResult;
}

export function protoTypeChange1Test19() {
    console.log('--- Testing Reflect.construct ---');

    const instanceFromReflect = Reflect.construct(C6, []);

    let result = Object.keys(instanceFromReflect);
    console.log('instanceFromReflect instanceof C6:', instanceFromReflect instanceof C6);
    result.push(instanceFromReflect instanceof C6);

    try {
        const c27InstanceFromReflect = Reflect.construct(C27, []);
        result.push(c27InstanceFromReflect);
        result.push(Object.getPrototypeOf(c27InstanceFromReflect));
    } catch (e) {
        result.push(e.message);
    }
    return result;
}

export function protoTypeChange1Test20() {
    const instanceC6 = new C6();
    instanceC6.publicField = 'I am public';

    console.log('--- Testing JSON serialization ---');

    const jsonString = JSON.stringify(instanceC6);
    let result = [];
    result.push(jsonString);

    const parsedObject = JSON.parse(jsonString);
    result.push(parsedObject.publicField)
    result.push(parsedObject instanceof C6);
    return result;
}

export function protoTypeChange1Test21() {
    class C6WithStaticPrivate {
        static #staticPrivateField = 'I am static and private';
        static #staticPrivateMethod() {
            return 'This is a static private method';
        }

        static getStaticPrivateValue() {
            return `${C6WithStaticPrivate.#staticPrivateField} (from method)`;
        }

        instanceMethod() {
            return 'Instance method cannot access static private field directly';
        }
    }
    let result = [];

    result.push(C6WithStaticPrivate.getStaticPrivateValue());

    const instanceWithStatic = new C6WithStaticPrivate();
    result.push(instanceWithStatic.instanceMethod());
    return result;
}

export function protoTypeChange1Test22() {
    const uniqueSymbolKey = Symbol('uniqueKey');
    let result = [];

    const instanceC6 = new C6();
    instanceC6[uniqueSymbolKey] = 'This is a value stored with a Symbol key';

    console.log('--- Testing Symbols as keys ---');

    result.push(instanceC6[uniqueSymbolKey]);
    result.push(Object.keys(instanceC6));
    console.log('for...in loop:');
    for (const key in instanceC6) {
        result.push(key);
    }

    result.push(Object.getOwnPropertySymbols(instanceC6)[0].toString());
    return result;
}

export function protoTypeChange1Test23() {
    const instanceC6 = new C6();
    let result = [];
    console.log('--- Testing private fields via public methods ---');

    result.push(instanceC6.hasPrivateB());
    result.push(instanceC6.getPrivateB());
    result.push(instanceC6.getPrivateB());
    return result;
}