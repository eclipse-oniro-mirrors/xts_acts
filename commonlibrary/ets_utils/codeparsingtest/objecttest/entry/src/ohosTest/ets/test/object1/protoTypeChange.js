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

export function protoTypeChangeTest0(){
    const dog = {
        bark() { return 'Woof!'; }
    };

    const cat = {
        meow() { return 'Meow!'; }
    };

    const myPet = {};

    Object.setPrototypeOf(myPet, dog);
    let bark1 = myPet.bark();

    Object.setPrototypeOf(myPet, cat);
    let neow = myPet.meow();
    let bark2 = '';
    try {
        bark2 = myPet.bark();
    } catch (e) {
        bark2 = e.message
    }
    return [bark1, neow, bark2]
}

export function protoTypeChangeTest1(){
    const animal = { eat() { return 'Eating...'; } };
    const myDog = { bark() { return 'Woof!'; } };

    myDog.__proto__ = animal;

    return [myDog.bark(), myDog.eat()];
}

export function protoTypeChangeTest2(){
    Array.prototype.sum = function() {
        return this.reduce((acc, val) => acc + val, 0);
    };

    const numbers = [1, 2, 3];
    let sum1 = numbers.sum();

    const libraryArray = [10, 20];
    let sum2 = libraryArray.sum();

    if (!Array.prototype.includes) {
        Array.prototype.includes = function(searchElement, fromIndex) {
        };
    }
    return [sum1, sum2]
}

export function protoTypeChangeTest3() {
    const animal = { eat() { return 'Eating...'; } };

    const dog = Object.create(animal);
    dog.bark = function() { return 'Woof!'; };

    return [dog.bark(), dog.eat()];
}

export function protoTypeChangeTest4(){
    class Animal {
        constructor(name) {
            this.name = name;
        }
        eat() {
            return `${this.name} is eating.`;
        }
    }

    class Dog extends Animal {
        bark() {
            return `${this.name} says woof!`;
        }
    }

    const myDog = new Dog('Buddy');
    return [myDog.bark(), myDog.eat()];
}

export function protoTypeChangeTest5(){
    const userInput = {
        name: 'Alice',
        settings: {
            theme: 'dark',
            __proto__: { isAdmin: true }
        }
    };

    function merge(target, source) {
        for (const key in source) {
            if (typeof source[key] === 'object' && source[key] !== null) {
                if (!target[key]) target[key] = {};
                merge(target[key], source[key]);
            } else {
                target[key] = source[key];
            }
        }
    }

    const config = {};
    merge(config, userInput.settings);

    return [config.theme, {}.isAdmin];
}

export function protoTypeChangeTest6(){
    const target = {};
    const handler = {
        getPrototypeOf(target) {
            console.log('Someone is getting the prototype!');
            return Array.prototype;
        },
        setPrototypeOf(target, proto) {
            console.log(`Someone is trying to set the prototype to ${proto}`);
            return false;
        }
    };

    const proxy = new Proxy(target, handler);

    let bool1 = Object.getPrototypeOf(proxy) === Array.prototype;

    try {
        Object.setPrototypeOf(proxy, {});
    } catch (e) {
        console.log(e.message)
    }
    return [bool1, Array.isArray(proxy)];
}

export function protoTypeChangeTest7(){
    const OldLibrary = {
        utils: {
            formatDate: function(date) {
                const year = date.getFullYear();
                const month = date.getMonth();
                const day = date.getDate();
                return `${year}-${String(month).padStart(2, '0')}-${String(day).padStart(2, '0')}`;
            }
        }
    };

    const originalFormatDate = OldLibrary.utils.formatDate;

    OldLibrary.utils.formatDate = function(date) {
        const correctedDate = new Date(date);
        correctedDate.setMonth(correctedDate.getMonth() + 1);
        return originalFormatDate(correctedDate);
    };

    const myDate = new Date(2023, 1, 1);
    return OldLibrary.utils.formatDate(myDate);
}

export function protoTypeChangeTest8(){
    const FrameworkCore = {
        version: '1.0.0',
        log: function(message) {
            return `[Framework] ${message}`;
        },
        _internalState: { isReady: false }
    };

    function createPlugin(pluginDefinition) {
        const pluginContext = Object.create(FrameworkCore);

        Object.assign(pluginContext, pluginDefinition);
        return pluginContext;
    }

    const LogPlugin = createPlugin({
        name: 'LogPlugin',
        init: function() {
            return this.log(`Plugin "${this.name}" initialized.`);
        }
    });

    const AnalyticsPlugin = createPlugin({
        name: 'AnalyticsPlugin',
        track: function(event) {
            return this.log(`Tracking event: ${event}`);
        }
    });


    FrameworkCore._internalState.isReady = true;
    let result1 = FrameworkCore.log('Framework is ready. Loading plugins...');

    let result2 = LogPlugin.init();
    let result3 = AnalyticsPlugin.track('user_login');
    return [result1, result2, result3];
}

export function protoTypeChangeTest9(){
    const criticalConfig = {
        apiUrl: 'https://api.example.com',
        timeout: 5000
    };

    const protectedConfig = new Proxy(criticalConfig, {
        getPrototypeOf(target) {
            console.warn('Warning: Someone is trying to get the prototype of criticalConfig.');
            return Object.prototype;
        },
        setPrototypeOf(target, proto) {
            console.log('Error: Attempt to modify the prototype of criticalConfig is forbidden!');
            return false;
        },
        deleteProperty(target, prop) {
            console.log(`Error: Attempt to delete property '${prop}' of criticalConfig is forbidden!`);
            return false;
        }
    });

    console.log(Object.getPrototypeOf(protectedConfig));
    let resultE = '';
    try {
        Object.setPrototypeOf(protectedConfig, { malicious: true });
    } catch (e) {
        resultE = e.message;
    }
    // delete protectedConfig.apiUrl;
    return [resultE, protectedConfig.apiUrl, protectedConfig.malicious];
}

export function protoTypeChangeTest10(){
    class Enemy {
        constructor(name, health) {
            this.name = name;
            this.health = health;
        }
        attack(target) {
            console.log(`${this.name} attacks ${target.name}!`);
            return this.applyDamage(target, 1);
        }

        applyDamage(target, damage) {
            target.health -= damage;
            return `${target.name} takes ${damage} damage. Health: ${target.health}`;
        }
    }

    class Zombie extends Enemy {
        constructor() {
            super('Zombie', 100);
        }

        attack(target) {
            super.attack(target);
            return this.applyDamage(target, 5);
        }
    }

    class Skeleton extends Enemy {
        constructor() {
            super('Skeleton', 50);
        }

        attack(target) {
            super.attack(target);
            return this.applyDamage(target, 3);
        }
    }


    const player = { name: 'Hero', health: 100 };
    const enemies = [new Zombie(), new Skeleton()];

    console.log('--- Battle Start ---');
    let result = [];
    enemies.forEach(enemy => {
        result.push(enemy.attack(player));
    });

    console.log('--- Battle End ---');
    return result;
}

export function protoTypeChangeTest11(){
    const UserPrototype = {
        type: 'Regular User',
        greet: function() {
            return `Hello, my name is ${this.name}`;
        },
        getLevel: function() {
            if (this.level) {
                return this.level;
            }
            console.log(`Calculating level for ${this.name}...`);
            this.level = Math.floor(this.registrationDays / 30) + 1;
            return this.level;
        }
    };

    function createUser(name, registrationDays) {
        const user = Object.create(UserPrototype);
        user.name = name;
        user.registrationDays = registrationDays;
        return user;
    }

    const alice = createUser('Alice', 150);
    const bob = createUser('Bob', 20);

    return [alice.greet(), bob.greet(), alice.type, bob.type, alice.type === bob.type, alice.getLevel(), alice.getLevel(), bob.getLevel()];
}

export function protoTypeChangeTest12(){
    const Loggable = {
        log: function(message) {
            console.log(`[${this.constructor.name}] ${message}`);
        }
    };

    const Serializable = {
        toJSON: function() {
            const data = Object.create(null);
            Object.keys(this).forEach(key => {
                data[key] = this[key];
            });
            return data;
        }
    };

    function applyMixins(targetClass, mixins) {
        mixins.forEach(mixin => {
            Object.assign(targetClass.prototype, mixin);
        });
    }

    class Model {
        constructor(id) {
            this.id = id;
        }
    }

    applyMixins(Model, [Loggable, Serializable]);

    class User extends Model {
        constructor(id, name) {
            super(id);
            this.name = name;
        }
    }

    const user = new User(1, 'Charlie');

    user.log('User instance created.');

    const userData = user.toJSON();
    return [userData.id, userData.name, userData.__proto__];
}

export function protoTypeChangeTest13(){
    const coreData = {
        user: { name: 'David', age: 30 },
        settings: { theme: 'light' }
    };

    function createReadOnlyProxy(target) {
        if (target.__readOnlyProxy__) {
            return target.__readOnlyProxy__;
        }

        const handler = {
            get(target, prop, receiver) {
                const value = Reflect.get(target, prop, receiver);
                if (value && typeof value === 'object') {
                    return createReadOnlyProxy(value);
                }
                return value;
            },
            set(target, prop, value, receiver) {
                console.log(`Error: Cannot modify property '${prop}'. This is a read-only view.`);
                return false;
            },
            deleteProperty(target, prop) {
                console.log(`Error: Cannot delete property '${prop}'. This is a read-only view.`);
                return false;
            }
        };

        const proxy = new Proxy(target, handler);
        Object.defineProperty(target, '__readOnlyProxy__', {
            value: proxy,
            enumerable: false,
            writable: false,
            configurable: false
        });
        return proxy;
    }

    const readOnlyData = createReadOnlyProxy(coreData);

    function componentA(data) {
        console.log(`Component A: User name is ${data.user.name}`);
        try {
            data.user.age = 31;
        } catch (e) {
            console.log(e.message);
        }
    }

    function componentB(data) {
        console.log(`Component B: Theme is ${data.settings.theme}`);
        try {
            delete data.user.name;
        } catch (e) {
            console.log(e.message);
        }
    }

    let result1 = readOnlyData.user.name;
    componentA(readOnlyData);
    let result2 = readOnlyData.user.age;
    componentB(readOnlyData);
    let result3 = readOnlyData.user.name;
    return [result1, result2, result3, coreData.user.age];
}

export function protoTypeChangeTest14(){
    const targetMap = new WeakMap();
    let activeEffect = null;

    function track(target, prop) {
        if (!activeEffect) return;
        let depsMap = targetMap.get(target);
        if (!depsMap) {
            targetMap.set(target, (depsMap = new Map()));
        }
        let dep = depsMap.get(prop);
        if (!dep) {
            depsMap.set(prop, (dep = new Set()));
        }
        dep.add(activeEffect);
    }

    function trigger(target, prop) {
        const depsMap = targetMap.get(target);
        if (!depsMap) return;
        const dep = depsMap.get(prop);
        if (dep) {
            dep.forEach(effect => effect());
        }
    }

    function reactive(target) {
        const handler = {
            get(target, prop, receiver) {
                const value = Reflect.get(target, prop, receiver);
                track(target, prop);
                if (value && typeof value === 'object') {
                    return reactive(value);
                }
                return value;
            },
            set(target, prop, value, receiver) {
                const oldValue = Reflect.get(target, prop, receiver);
                if (oldValue !== value) {
                    Reflect.set(target, prop, value, receiver);
                    trigger(target, prop);
                }
                return true;
            }
        };
        return new Proxy(target, handler);
    }

    function watchEffect(effect) {
        activeEffect = effect;
        effect();
        activeEffect = null;
    }
    const state = reactive({
        count: 0,
        user: { name: 'Eve' }
    });

    watchEffect(() => {
        console.log(`Count has changed to: ${state.count}`);
    });

    // watchEffect(() => {
    //     document.body.textContent = `User's name is: ${state.user.name}`;
    // });


    console.log('--- Modifying state ---');
    let count1 = state.count, name1 = state.user.name, prop1 = state.otherProp;

    state.count++;

    state.user.name = 'Eve Modified';

    state.otherProp = 'test';
    return [count1, name1, prop1, state.count, state.user.name, state.otherProp]
}

export function protoTypeChangeTest15(){
    function fetchUserAndLog(apiClient, userId, logger) {
        return apiClient.getUser(userId)
            .then(user => {
                logger.log(`Fetched user: ${user.name}`);
                return user;
            });
    }

    function createMock() {
        const calls = [];
        const mock = new Proxy({}, {
            get(target, prop) {
                return (...args) => {
                    calls.push({ method: prop, args });
                    return Promise.resolve({ id: args[0], name: `Mock User ${args[0]}` });
                };
            }
        });
        mock.assertCalledWith = (method, ...expectedArgs) => {
            const call = calls.find(c => c.method === method);
            if (!call) {
                throw new Error(`Mock method '${method}' was not called.`);
            }
            if (!expectedArgs.every((arg, i) => arg === call.args[i])) {
                throw new Error(`Mock method '${method}' was called with ${JSON.stringify(call.args)}, but expected ${JSON.stringify(expectedArgs)}.`);
            }
            console.log(`✅ Assertion passed: '${method}' was called with correct arguments.`);
        };
        return mock;
    }

    const mockApiClient = createMock();
    return true;
}

export function protoTypeChangeTest16(){
    class ValidationError extends Error {
        constructor(message, field) {
            super(message);
            this.name = 'ValidationError';
            this.field = field;
        }
    }

    function validateUserInput(input) {
        if (!input.email) {
            throw new ValidationError('Email is required.', 'email');
        }
        if (!input.age || typeof input.age !== 'number' || input.age < 18) {
            throw new ValidationError('Age must be a number and at least 18.', 'age');
        }
        return true;
    }


    function processForm(input) {
        let result = '';
        try {
            validateUserInput(input);
            result = '✅ Form is valid. Processing...';
        } catch (error) {
            if (error instanceof ValidationError) {
                result = `❌ Validation failed for field '${error.field}': ${error.message}`;
            } else {
                result = `❌ An unexpected error occurred: ${error.message}`;
            }
        }
        return result;
    }

    let result1 = processForm({ email: 'test@example.com', age: 25 });
    let result2 = processForm({ email: 'test@example.com', age: 15 });
    let result3 = processForm({ age: 25 });
    return [result1, result2, result3];
}

export function protoTypeChangeTest17(){
    try {
        console.log(Object.getPrototypeOf(null));
    } catch (e) {
        console.log(e.message);
    }
    return [null instanceof Object, null instanceof Array, null instanceof Number, typeof null];
}

export function protoTypeChangeTest18(){
    const normalDict = {};
    let result1 = normalDict.toString;

    normalDict.toString = 'my custom string';
    let result2 = normalDict.toString;

    const pureDict = Object.create(null);
    let result3 = Object.getPrototypeOf(pureDict);
    let result4 = normalDict.toString;
    pureDict.toString = 'my custom string';
    pureDict.anotherKey = 123;

    let result5 = normalDict.toString;
    let result6 = normalDict.anotherKey;
    let result7 = Object.prototype.hasOwnProperty.call(pureDict, 'toString');
    let result8 = Object.prototype.hasOwnProperty.call(pureDict, 'valueOf');
    return [result1, result2, result3, result4, result5, result6, result7, result8];
}

export function protoTypeChangeTest19(){
    const grandparent = { a: 1 };
    const parent = Object.create(grandparent);
    parent.b = 2;
    const child = Object.create(parent);
    child.c = 3;
    let result = [];

    result.push(child.c);
    result.push(child.b);
    result.push(child.a);

    result.push(child.d);

    const obj = { prop: 'value' };
    result.push(obj.toString());

    Object.setPrototypeOf(obj, null);
    result.push(obj.prop);
    try {
        result.push(obj.toString());
    } catch (e) {
        console.log(e.message);
    }
    return result;
}

export function protoTypeChangeTest20(){
    const data = {
        id: 1,
        name: 'Frank',
        middleName: null,
        age: undefined,
        address: {
            street: '123 Main St',
            city: 'Anytown',
            zipCode: null
        }
    };

    const jsonString = JSON.stringify(data, null, 2);

    return jsonString;
}
export function protoTypeChangeTest21(){
    console.log('Before patching, Array.prototype.sum is:', Array.prototype.sum);
    function arraySum() {
        return this.reduce((acc, current) => acc + current, 0);
    }

    let result = [];
    console.log('--- Patching Array.prototype ---');
    Array.prototype.sum = arraySum;

    const numbers = [1, 2, 3, 4, 5];
    const total = numbers.sum();
    result.push(total);

    const emptyArray = [];
    result.push(emptyArray.sum())

    const anotherArray = [10, 20];
    result.push(anotherArray.sum());
    return result;
}

export function protoTypeChangeTest22(){
    console.log('--- Patching Object.prototype with "is" ---');
    // Object.prototype.is = function(other) {
    //     console.log('Using our custom "is" method!');
    //     return this === other;
    // };
    let result = [];

    const obj1 = { a: 1 };
    const obj2 = { a: 1 };
    const obj3 = obj1;

    result.push(obj1.is(obj3));
    // Object.prototype.is = function(other) {
    //     console.log('Using the new conflicting "is" method!');
    //     return JSON.stringify(this) === JSON.stringify(other);
    // };
    result.push(obj1.is(obj2));
    result.push(obj1.is(obj3));
    return result;
}

export function protoTypeChangeTest23(){
    const user = { id: 1, name: 'Grace' };
    console.log('--- Looping over user before patching ---');
    let result = [];
    for (const key in user) {
        result.push(key);
    }

    console.log('--- Patching Object.prototype ---');
    // Object.prototype.customMethod = function() { /* ... */ };
    console.log('--- Looping over user after patching ---');
    for (const key in user) {
        result.push(key);
    }

    console.log('--- Looping with hasOwnProperty check ---');
    for (const key in user) {
        if (user.hasOwnProperty(key)) {
            result.push(key);
        }
    }
    return result;
}

export function protoTypeChangeTest24(){
    const iterations = 10_0;
    const testArray = [1, 2, 3, 4, 5];

    function testPerformance() {
        console.time('array access');
        for (let i = 0; i < iterations; i++) {
            const value = testArray[0];
        }
        console.timeEnd('array access');
    }

    console.log('--- Testing performance before patching ---');
    testPerformance();

    console.log('--- Patching Array.prototype ---');
    Array.prototype.mySlowMethod = function() { /* ... */ };

    console.log('--- Testing performance after patching ---');
    testPerformance();
    return true;
}

export function protoTypeChangeTest25(){
    const calculator = {
        value: 0,
        add(num) {
            this.value += num;
        },
        subtract(num) {
            this.value -= num;
        },
        multiply(num) {
            this.value *= num;
        },
        getValue() {
            return this.value;
        }
    };

    function createChainer(target) {
        const handler = {
            get(target, prop, receiver) {
                const originalMethod = Reflect.get(target, prop, receiver);

                if (typeof originalMethod !== 'function') {
                    return originalMethod;
                }

                return function(...args) {
                    const result = originalMethod.apply(target, args);

                    if (result !== undefined) {
                        return result;
                    }
                    return receiver;
                };
            }
        };

        return new Proxy(target, handler);
    }
    const chainableCalculator = createChainer(calculator);
    const finalValue = chainableCalculator
        .add(10)
        .subtract(3)
        .multiply(2)
        .getValue();

    return [finalValue, calculator.value];
}

export function protoTypeChangeTest26(){
    const userSchema = {
        name: {
            validate: (value) => typeof value === 'string' && value.trim().length > 0,
            message: 'Name must be a non-empty string.'
        },
        age: {
            transform: (value) => {
                const num = Number(value);
                return isNaN(num) ? value : num;
            },
            validate: (value) => typeof value === 'number' && value > 0 && value < 120,
            message: 'Age must be a valid number between 1 and 119.'
        },
        email: {
            validate: (value) => /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value),
            message: 'Email must be a valid email address.'
        }
    };

    function createValidator(target, schema) {
        const handler = {
            set(target, prop, value, receiver) {
                if (schema[prop]) {
                    const { transform, validate, message } = schema[prop];
                    let newValue = value;

                    if (transform) {
                        newValue = transform(newValue);
                    }

                    if (validate && !validate(newValue)) {
                        throw new TypeError(`Validation failed for property '${prop}': ${message}`);
                    }

                    return Reflect.set(target, prop, newValue, receiver);
                }

                return Reflect.set(target, prop, value, receiver);
            }
        };

        return new Proxy(target, handler);
    }

    const user = {};
    const validatedUser = createValidator(user, userSchema);
    let result = [];

    try {
        validatedUser.name = 'Alice';
        validatedUser.age = '30';
        validatedUser.email = 'alice@example.com';

        console.log('User data is valid:', validatedUser);
        console.log('--- Attempting to set invalid data ---');
        validatedUser.age = -5;
    } catch (e) {
        result.push(e.message);
    }

    try {
        validatedUser.email = 'not-an-email';
    } catch (e) {
        result.push(e.message);
    }
    return result;
}

export function protoTypeChangeTest27(){
    const target = {
        name: 'Original',
        greet() {
            return `Hello from ${this.name}`;
        }
    };

    const handler = {
        get(target, prop, receiver) {
            console.log(`GETTING property: ${prop}`);
            return Reflect.get(target, prop, receiver);
        },
        set(target, prop, value, receiver) {
            console.log(`SETTING property: ${prop} to ${value}`);
            return Reflect.set(target, prop, value, receiver);
        }
    };

    const proxy = new Proxy(target, handler);
    let result = [];
    result.push(proxy.name);
    result.push(proxy.greet());

    proxy.name = 'Proxy';
    result.push(proxy.name);
    return result;
}

export function protoTypeChangeTest28(){
    const defaultConfigPrototype = {
        theme: 'light',
        layout: 'grid',
        pagination: {
            pageSize: 10,
            currentPage: 1
        },
        resetPagination() {
            this.pagination = { ...this.pagination, currentPage: 1 };
        }
    };

    function createUserConfig(userSpecificSettings = {}) {
        const newConfig = Object.create(defaultConfigPrototype);
        return Object.assign(newConfig, userSpecificSettings);
    }
    let result = [];

    const configA = createUserConfig({ theme: 'dark' });
    const configB = createUserConfig({ layout: 'list' });
    const configC = createUserConfig();

    result.push(configA.theme);
    result.push(configA.layout);
    result.push(configB.pagination.pageSize);

    configB.resetPagination();
    result.push(configB.pagination.currentPage);

    configA.pagination.currentPage = 2;
    console.log('Config A page:', configA.pagination.currentPage);
    console.log('Config B page:', configB.pagination.currentPage);
    console.log('Default prototype page:', defaultConfigPrototype.pagination.currentPage);
    result.push(configA.pagination.currentPage);
    result.push(configB.pagination.currentPage);
    result.push(defaultConfigPrototype.pagination.currentPage);
    result.push(Object.getPrototypeOf(configA) === defaultConfigPrototype);
    return result;
}

export function protoTypeChangeTest29(){
    const lazyMathPrototype = {
        get add() {
            console.log('Lazy-loading "add" method...');
            const addMethod = function(a, b) {
                return a + b;
            };
            Object.defineProperty(this, 'add', {
                value: addMethod,
                writable: true,
                enumerable: false,
                configurable: true
            });
            return addMethod;
        },

        get multiply() {
            console.log('Lazy-loading "multiply" method...');
            const multiplyMethod = function(a, b) {
                return a * b;
            };
            Object.defineProperty(this, 'multiply', {
                value: multiplyMethod,
                writable: true,
                enumerable: false,
                configurable: true
            });
            return multiplyMethod;
        }
    };

    const calculator = Object.create(lazyMathPrototype);
    let result = [];
    console.log('--- First call to add ---');
    result.push(calculator.add(2, 3));
    console.log('--- Second call to add ---');
    result.push(calculator.add(4, 5));

    console.log('--- First call to multiply ---');
    result.push(calculator.multiply(3, 4));
    return result;
}

export function protoTypeChangeTest30(){
    function createObservable(target) {
        const observers = new Set();

        function notify(data) {
            observers.forEach(observer => observer(data));
        }

        const proxy = new Proxy(target, {
            set(target, prop, value, receiver) {
                const oldValue = Reflect.get(target, prop, receiver);
                if (oldValue !== value) {
                    Reflect.set(target, prop, value, receiver);
                    notify({ prop, oldValue, newValue: value, target: receiver });
                }
                return true;
            }
        });

        proxy.subscribe = (observer) => observers.add(observer);
        proxy.unsubscribe = (observer) => observers.delete(observer);

        return proxy;
    }

    const user = createObservable({
        name: 'Charlie',
        age: 25
    });

    const loggerObserver = (data) => {
        console.log(`[LOGGER] Property '${data.prop}' changed from ${data.oldValue} to ${data.newValue}`);
    };

    const uiUpdaterObserver = (data) => {
        if (data.prop === 'name') {
            console.log(`[UI] Updating display name to: ${data.newValue}`);
        }
    };

    user.subscribe(loggerObserver);
    user.subscribe(uiUpdaterObserver);

    console.log('--- Changing name ---');
    user.name = 'Charlie Brown';

    console.log('--- Changing age ---');
    user.age = 26;

    user.unsubscribe(uiUpdaterObserver);
    console.log('--- Changing name after unsubscribing UI updater ---');
    user.name = 'Charles Brown';
    return true;
}

export function protoTypeChangeTest31(){
    const v10 = 0;
    function f15(){
        return f15;
    }
    const t15 = f15();
    t15.prototype = null;
    class C25 extends f15{
    }
    const v28 = C25.prototype;
    v28.a = v10;
    return true;
}

export function protoTypeChangeTest32(){
    function f15(){
        return f15;
    }
    const t15 = f15();
    t15.prototype = null;
    class C25 extends f15{
    }
    const instance = new C25();
    let result = [];

    result.push(instance.a);

    result.push(Object.getPrototypeOf(instance) === C25.prototype);
    result.push(Object.getPrototypeOf(C25.prototype));
    result.push(Object.getPrototypeOf(C25.prototype));
    result.push(instance.toString);
    result.push(instance.hasOwnProperty);

    try {
        instance.toString();
    } catch (e) {
        result.push(e.message);
    }
    return result;
}

export function protoTypeChangeTest33(){
    function f15(){
        return f15;
    }
    let result = [];
    const t15 = f15();
    t15.prototype = null;
    try {
        const fInstance = new f15();

        result.push(fInstance);
        result.push(typeof fInstance);
        result.push(Object.getPrototypeOf(fInstance));
        result.push(fInstance.toString);
    } catch (e) {
        console.log('Error creating instance with new f15():', e.message);
    }
    return result;
}

export function protoTypeChangeTest34(){
    function f15(){
        return f15;
    }
    const t15 = f15();
    t15.prototype = null;
    class C25 extends f15{
    }
    const instance = new C25();
    let result = [];
    result.push(instance instanceof C25);
    try {
        result.push(instance instanceof f15);
    } catch (e){
        result.push(e.message);
    }

    const fInstance = new f15();
    try {
        result.push(fInstance instanceof f15);
    } catch (e) {
        result.push(e.message);
    }
    return result;
}

export function protoTypeChangeTest35(){
    function f15(){
        return f15;
    }
    const t15 = f15();
    t15.prototype = null;
    class C25Extended extends f15 {
        constructor() {
            console.log('Entering C25Extended constructor');
            const superResult = super();
            console.log('Result of super():', superResult);
            console.log('Is superResult equal to f15?', superResult === f15);
            console.log('this after super():', this);
        }
    }

    const extendedInstance = new C25Extended();
    return extendedInstance.a === undefined;
}

export function protoTypeChangeTest36(){
    function f15(){
        return f15;
    }
    const t15 = f15();
    t15.prototype = null;
    class C25Extended extends f15 {
        constructor() {
            console.log('Entering C25Extended constructor');
            const superResult = super();
            console.log('Result of super():', superResult);
            console.log('Is superResult equal to f15?', superResult === f15);
            console.log('this after super():', this);
        }
    }

    const extendedInstance = new C25Extended();
    return extendedInstance.a === undefined;
}

export function protoTypeChangeTest37(){
    function f15(){
        return f15;
    }
    class C25 extends f15{
    }
    let result = [];
    console.log('--- Testing C25 as a constructor ---');
    const instance = new C25();

    result.push(instance.toString());
    result.push(instance.a);
    result.push(Object.getPrototypeOf(instance) === C25.prototype);
    return result;
}

export function protoTypeChangeTest38(){
    function f15(){
        return f15;
    }
    class C25 extends f15{
    }
    console.log('--- Testing calling C25 as a function ---');

    try {
        C25();
    } catch (e) {
        console.log('Error calling C25():', e.message);
    }
    return true;
}

export function protoTypeChangeTest39(){
    function f15(){
        return f15;
    }
    class C25 extends f15{
    }
    let result = [];
    const cProto = C25.prototype;

    result.push(typeof cProto);
    result.push(cProto.constructor);

    result.push(Object.getPrototypeOf(cProto));

    result.push(cProto.hasOwnProperty('a'));
    result.push(cProto.a);
    result.push(cProto.toString);
    return result;
}

export function protoTypeChangeTest40(){
    function f15(){
        return f15;
    }
    class C25 extends f15{
    }
    const instance = new C25();
    let result = [];
    result.push(instance instanceof C25);
    result.push(instance instanceof f15);
    result.push(C25.prototype.isPrototypeOf(instance));
    result.push(f15.prototype.isPrototypeOf(instance));

    try {
        result.push(null.isPrototypeOf(instance));
    } catch (e) {
        result.push(e.message);
    }
    return result;
}
export function protoTypeChangeTest41(){
    function f15(){
        return f15;
    }
    class C25 extends f15{
    }
    const instance = new C25();
    let result = [];
    result.push(instance.constructor);
    result.push(instance.hasOwnProperty('constructor'));
    result.push(C25.prototype.hasOwnProperty('constructor'));
    result.push(C25.prototype.constructor);
    return result;
}

export function protoTypeChangeTest42(){
    function f15(){
        return f15;
    }
    class C25 extends f15{
    }
    let result = [];
    result.push(C25.__proto__ === f15);
    result.push(f15.isPrototypeOf(C25));
    result.push(f15.prototype.isPrototypeOf(C25.prototype));
    return result;
}

export function protoTypeChangeTest43(){
    function f15(){
        return f15;
    }
    class C25 extends f15{
    }
    let result = [];
    result.push(f15.name);
    result.push(f15.length);
    result.push(C25.name);
    result.push(C25.length);

    f15.customProp = 'I am from f15';
    result.push(C25.customProp);
    return result;
}

export function protoTypeChangeTest44(){
    function f15(){
        return this;
    }
    class C25 extends f15{
    }
    const instance = new C25();
    instance.b = 'hello';
    let result = [];
    const jsonString = JSON.stringify(instance);
    result.push(jsonString);

    const parsedObject = JSON.parse(jsonString);
    result.push(parsedObject)
    result.push(parsedObject.a)
    result.push(parsedObject.b)
    return result;
}

export function protoTypeChangeTest45(){
    function f15(){
        return f15;
    }
    class C25 extends f15{
    }
    const cProto = C25.prototype;
    let result = [];
    result.push(Object.keys(cProto).toString())

    result.push(Object.getOwnPropertyNames(cProto).toString())
    return result;
}

export function protoTypeChangeTest46(){
    function f15(){
        return f15;
    }
    class C25 extends f15{
    }
    const instance = new C25();
    instance.b = 'hello';
    let result = [];
    result.push(('a' in instance));
    result.push(('b' in instance));
    result.push(('toString' in instance));

    result.push(instance.hasOwnProperty('a'));
    result.push(instance.hasOwnProperty('b'));
    return result;
}

export function protoTypeChangeTest47(){
    function f15(){
        return f15;
    }
    class C25 extends f15{
    }
    const instance = new C25();
    instance.b = 'hello';
    let result = [];
    for (const key in instance) {
        result.push(key);
    }
    return result;
}

export function protoTypeChangeTest48(){
    function f15(){
        return f15;
    }
    class C25 extends f15{
    }
    const instance = new C25();
    instance.b = 'hello';
    Object.defineProperty(instance, 'c', {
        value: 42,
        enumerable: false
    });
    let result = [];
    result.push(Reflect.ownKeys(instance).toString())

    result.push(Object.keys(instance).toString())
    return result;
}

export function protoTypeChangeTest49(){
    function f15(){
        return f15;
    }
    class C25 extends f15{
    }
    const instance1 = new C25();
    const instance2 = new C25();
    let result = [];
    result.push(instance1.b);

    C25.prototype.b = 'I am from prototype';

    result.push(instance1.b);
    result.push(instance2.b);

    C25.prototype.a = 100;
    result.push(instance1.b);
    return result;
}

export function protoTypeChangeTest50(){
    function f15(){
        return f15;
    }
    class C25 extends f15{
    }
    const instance = new C25();
    let result = [];

    result.push(instance.a);

    instance.a = 999;

    result.push(instance.a);

    result.push(C25.prototype.a);

    delete instance.a;
    result.push(instance.a);
    return result;
}

export function protoTypeChangeTest51(){
    function f15(){
        return f15;
    }
    class C25 extends f15{
    }
    const cProto = C25.prototype;
    let result = [];
    const objFromProto = Object.create(cProto);

    result.push(objFromProto.a);
    result.push(objFromProto instanceof C25);

    result.push(objFromProto.constructor);

    result.push(objFromProto instanceof f15);
    return result;
}

export function protoTypeChangeTest52(){
    function f15(){
        return f15;
    }
    class C25 extends f15{
    }
    let result = [];
    result.push(Object.getPrototypeOf(f15) === Function.prototype);

    result.push(typeof f15.apply);
    result.push(typeof f15.bind);

    result.push(typeof f15.apply);
    return result;
}

export function protoTypeChangeTest53(){
    function f15(){
        return f15;
    }
    class C25 extends f15{
    }
    const instance = new C25();
    const newPrototype = { c: 300 };
    let result = [];
    result.push(instance.a);
    result.push(instance.c);

    Object.setPrototypeOf(instance, newPrototype);

    result.push(instance.a);
    result.push(instance.c);

    result.push(instance instanceof C25);
    return result;
}

export function protoTypeChangeTest54(){
    function f15(){
        return this;
    }
    class C25Extended extends f15 {
        constructor() {
            super();
        }

        getParentPrototype() {
            return Object.getPrototypeOf(this.constructor.prototype);
        }

        tryToCallSuperMethod() {
            try {
                return super.toString();
            } catch (e) {
                return e.message;
            }
        }
    }
    let result = [];
    const extendedInstance = new C25Extended();
    result.push(Object.getPrototypeOf(C25Extended.prototype));
    result.push(extendedInstance.getParentPrototype());
    result.push(extendedInstance.tryToCallSuperMethod());
    return result;
}

export function protoTypeChangeTest55(){
    function f15(){
        return f15;
    }
    class C25 extends f15{
    }
    const instance = new C25();
    instance.b = 'hello';
    let result = [];
    const proxy = new Proxy(instance, {
        get(target, prop, receiver) {
            console.log(`Proxy GET trap: trying to access '${prop}'`);

            const value = Reflect.get(target, prop, receiver);

            if (value === undefined) {
                console.log(`Property '${prop}' not found.`);
                return `Default value for '${prop}'`;
            }

            return value;
        }
    });
    result.push(proxy.b)
    result.push(proxy.a)
    result.push(proxy.foo)
    return result;
}

export function protoTypeChangeTest56(){
    function f15(){
        return f15;
    }
    class C25 extends f15{
    }
    const instance = new C25();
    let result = [];

    try {
        instance.toString();
    } catch (e) {
        result.push(e.message);
    }

    const instanceStr = Object.prototype.toString.call(instance);
    result.push(instanceStr);

    instance.ownProp = 'I am own';
    const hasOwn = Object.prototype.hasOwnProperty.call(instance, 'ownProp');
    result.push(hasOwn);
    return result;
}

export function protoTypeChangeTest57(){
    function f15(){
        return f15;
    }
    class C25 extends f15{
    }
    let result = [];
    const instance = new C25();
    const proto = C25.prototype;

    console.log('--- Testing Object.freeze ---');

    instance.b = 'new value';
    Object.freeze(instance);
    result.push(instance.b);

    proto.a = 100;
    proto.newProp = 'hello';
    Object.freeze(proto);
    result.push(proto.a);
    result.push(proto.newProp);

    const newInstance = new C25();
    result.push(newInstance.a);
    return result;
}
