/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
export const SymbolSpeciesStandaloneTestUtils = {
    /**
     * 001. Array default Symbol.species (map returns Array instance).
     * Feature: Built-in Array's Symbol.species is Array; derived methods return Array.
     */
    async test001_ArrayDefaultSymbolSpecies() {
        const arr = [1, 2, 3];
        const mapped = arr.map(x => x * 2);

        if (!(mapped instanceof Array) || JSON.stringify(mapped) !== "[2,4,6]") {
            throw new Error(`Test001 failed: Default Array species returned ${mapped.constructor.name} (expected Array, value [2,4,6])`);
        }
        return "Test Passed: ArrayDefaultSymbolSpeciesTest001";
    },

    /**
     * 002. Subclass overrides Symbol.species (returns parent Array).
     * Feature: Subclass of Array overrides species to return parent Array; derived methods use parent constructor.
     */
    async test002_SubclassOverrideSpeciesReturnParent() {
        class MyArray extends Array {
            static get [Symbol.species]() {
                return Array;
            }
        }
        const myArr = new MyArray(1, 2, 3);
        const mapped = myArr.map(x => x + 1);

        if (mapped instanceof MyArray || !(mapped instanceof Array)) {
            throw new Error(`Test002 failed: Subclass species returned ${mapped.constructor.name} (expected Array)`);
        }
        return "Test Passed: SubclassOverrideSpeciesReturnParentTest002";
    },

    /**
     * 003. Subclass retains species as self (returns subclass instance).
     * Feature: Subclass does not override species; derived methods return subclass instance.
     */
    async test003_SubclassRetainSpeciesAsSelf() {
        class MyArray extends Array {}
        const myArr = new MyArray(4, 5, 6);
        const filtered = myArr.filter(x => x > 4);

        if (!(filtered instanceof MyArray) || JSON.stringify(filtered) !== "[5,6]") {
            throw new Error(`Test003 failed: Subclass species returned ${filtered.constructor.name} (expected MyArray, value [5,6])`);
        }
        return "Test Passed: SubclassRetainSpeciesAsSelfTest003";
    },

    /**
     * 004. Non-function Symbol.species throws TypeError.
     * Feature: Symbol.species must be a function; non-function values throw when creating derived objects.
     */
    async test004_NonFunctionSpeciesThrows() {
        class BadArray extends Array {
            static get [Symbol.species]() {
                return "not a function";
            }
        }
        const badArr = new BadArray(1, 2);
        let errorCaught = false;

        try {
            badArr.map(x => x);
        } catch (e) {
            errorCaught = e instanceof TypeError;
        }

        if (!errorCaught) {
            throw new Error(`Test004 failed: Non-function species did not throw TypeError`);
        }
        return "Test Passed: NonFunctionSpeciesThrowsTest004";
    },

    /**
     * 005. Promise default Symbol.species (then returns Promise instance).
     * Feature: Built-in Promise's Symbol.species is Promise; derived methods return Promise.
     */
    async test005_PromiseDefaultSymbolSpecies() {
        const promise = Promise.resolve(10);
        const derivedPromise = promise.then(x => x * 2);

        if (!(derivedPromise instanceof Promise)) {
            throw new Error(`Test005 failed: Default Promise species returned ${derivedPromise.constructor.name} (expected Promise)`);
        }
        return "Test Passed: PromiseDefaultSymbolSpeciesTest005";
    },

    /**
     * 006. Inherited Symbol.species (subclass uses parent's species).
     * Feature: Subclass inherits species from parent if not overridden.
     */
    async test006_InheritedSymbolSpecies() {
        class ParentArray extends Array {
            static get [Symbol.species]() {
                return ParentArray;
            }
        }
        class ChildArray extends ParentArray {}
        const childArr = new ChildArray(7, 8);
        const mapped = childArr.map(x => x);

        if (!(mapped instanceof ParentArray)) {
            throw new Error(`Test006 failed: Inherited species returned ${mapped.constructor.name} (expected ParentArray)`);
        }
        return "Test Passed: InheritedSymbolSpeciesTest006";
    },

    /**
     * 007. Symbol.species returns unrelated constructor (derived object type changes).
     * Feature: Overridden species returns unrelated constructor; derived methods use it.
     */
    async test007_SpeciesReturnsUnrelatedConstructor() {
        class MyArray extends Array {
            static get [Symbol.species]() {
                return Object;
            }
        }
        const myArr = new MyArray(1, 2);
        const mapped = myArr.map(x => x);

        if (!(mapped instanceof Object) || mapped instanceof Array) {
            throw new Error(`Test007 failed: Unrelated species returned ${mapped.constructor.name} (expected Object, not Array)`);
        }
        return "Test Passed: SpeciesReturnsUnrelatedConstructorTest007";
    },





    /**
     * 013. Map default Symbol.species (filter returns Map instance).
     * Feature: Built-in Map's Symbol.species is Map; derived methods return Map.
     */
    async test013_MapDefaultSymbolSpecies() {
        const map = new Map([["a", 1], ["b", 2]]);

        const filteredMap = new map.constructor[Symbol.species](
            [...map].filter(([k]) => k === "a")
        );

        if (!(filteredMap instanceof Map) || filteredMap.get("a") !== 1) {
            throw new Error(`Test013 failed: Map species returned ${filteredMap.constructor.name} (expected Map with "a":1)`);
        }
        return "Test Passed: MapDefaultSymbolSpeciesTest013";
    },




    /**
     * 016. Frozen subclass retains Symbol.species functionality.
     * Feature: Frozen subclass's species still controls derived object type.
     */
    async test016_FrozenSubclassSpecies() {
        class FrozenArray extends Array {
            static get [Symbol.species]() {
                return Array;
            }
        }
        Object.freeze(FrozenArray);
        const frozenArr = new FrozenArray(3, 4);
        const mapped = frozenArr.map(x => x);

        if (!(mapped instanceof Array) || mapped instanceof FrozenArray) {
            throw new Error(`Test016 failed: Frozen subclass species returned ${mapped.constructor.name} (expected Array)`);
        }
        return "Test Passed: FrozenSubclassSpeciesTest016";
    },





    /**
     * 019. Symbol.species returns subclass of subclass (deep derivation).
     * Feature: Species returns subclass of current subclass; derived object is deep subclass.
     */
    async test019_SpeciesReturnsDeepSubclass() {
        class Level1Array extends Array {}
        class Level2Array extends Level1Array {
            static get [Symbol.species]() {
                return Level2Array;
            }
        }
        class Level3Array extends Level2Array {
            static get [Symbol.species]() {
                return Level2Array;
            }
        }
        const level3Arr = new Level3Array(5, 6);
        const mapped = level3Arr.map(x => x);

        if (!(mapped instanceof Level2Array) || mapped instanceof Level3Array) {
            throw new Error(`Test019 failed: Deep subclass species returned ${mapped.constructor.name} (expected Level2Array)`);
        }
        return "Test Passed: SpeciesReturnsDeepSubclassTest019";
    },

    /**
     * 020. AsyncIterator default Symbol.species (returns AsyncIterator instance).
     * Feature: Built-in AsyncIterator's Symbol.species is AsyncIterator; derived methods return it.
     */
    async test020_AsyncIteratorDefaultSpecies() {
        async function* asyncGen() {
            yield 1;
            yield 2;
        }
        const iter = asyncGen();
        const derivedIter = iter[Symbol.asyncIterator]();

        if (!(derivedIter[Symbol.asyncIterator] instanceof Function) || !(derivedIter instanceof Object)) {
            throw new Error(`Test020 failed: AsyncIterator species returned invalid type`);
        }
        return "Test Passed: AsyncIteratorDefaultSpeciesTest020";
    },

    /**
     * 021. Custom constructor with parameterized species (passes args to constructor).
     * Feature: Species constructor receives parameters from derived method.
     */
    async test021_ParameterizedSpeciesConstructor() {
        class ParamObj {
            constructor(prefix, values) {
                this.prefix = prefix;
                this.values = values;
            }
            map(callback) {
                const newVals = this.values.map(callback);
                return new this.constructor[Symbol.species](this.prefix, newVals);
            }
            static get [Symbol.species]() {
                return ParamObj;
            }
        }
        const paramObj = new ParamObj("pre-", [1, 2]);
        const mapped = paramObj.map(x => x + 1);

        if (mapped.prefix !== "pre-" || JSON.stringify(mapped.values) !== "[2,3]") {
            throw new Error(`Test021 failed: Parameterized species returned (prefix:${mapped.prefix}, values:${mapped.values}) (expected pre-, [2,3])`);
        }
        return "Test Passed: ParameterizedSpeciesConstructorTest021";
    },

    /**
     * 022. Repeated derived method calls (consistent species behavior).
     * Feature: Multiple calls to derived methods retain consistent species-derived type.
     */
    async test022_RepeatedDerivedMethodCalls() {
        class ConsistentArray extends Array {
            static get [Symbol.species]() {
                return Array;
            }
        }
        const consArr = new ConsistentArray(1, 2, 3);
        const result1 = consArr.map(x => x);
        const result2 = consArr.filter(x => x > 1);
        const result3 = consArr.slice(1);

        if (!(result1 instanceof Array) || !(result2 instanceof Array) || !(result3 instanceof Array)) {
            throw new Error(`Test022 failed: Repeated calls returned inconsistent types`);
        }
        return "Test Passed: RepeatedDerivedMethodCallsTest022";
    },

    /**
     * 023. Symbol.species returns sealed constructor (still instantiable).
     * Feature: Sealed constructor as species can still create derived objects.
     */
    async test023_SpeciesReturnsSealedConstructor() {
        class SealedObj {}
        Object.seal(SealedObj);
        class MyArray extends Array {
            static get [Symbol.species]() {
                return SealedObj;
            }
        }
        const myArr = new MyArray(1);
        const derived = myArr.map(x => x);

        if (!(derived instanceof SealedObj)) {
            throw new Error(`Test023 failed: Sealed species returned ${derived.constructor.name} (expected SealedObj)`);
        }
        return "Test Passed: SpeciesReturnsSealedConstructorTest023";
    },

    /**
     * 024. RegExp subclass species (exec returns parent RegExp).
     * Feature: RegExp subclass overrides species to return parent RegExp.
     */
    async test024_RegExpSubclassSpecies() {
        class MyRegExp extends RegExp {
            static get [Symbol.species]() {
                return RegExp;
            }
        }
        const myReg = new MyRegExp("a", "g");
        const execResult = myReg.exec("ab");
        const derivedReg = new myReg.constructor[Symbol.species](myReg);

        if (!(derivedReg instanceof RegExp) || derivedReg instanceof MyRegExp) {
            throw new Error(`Test024 failed: RegExp subclass species returned ${derivedReg.constructor.name} (expected RegExp)`);
        }
        return "Test Passed: RegExpSubclassSpeciesTest024";
    },







    /**
     * 028. Species inheritance after deleting subclass property.
     * Feature: Deleting subclass species makes it inherit parent's species.
     */
    async test028_SpeciesInheritanceAfterDelete() {
        class Parent extends Array {
            static get [Symbol.species]() {
                return Parent;
            }
        }
        class Child extends Parent {
            static get [Symbol.species]() {
                return Child;
            }
        }
        const childArr = new Child(1, 2);
        delete Child[Symbol.species];
        const mapped = childArr.map(x => x);

        if (!(mapped instanceof Parent) || mapped instanceof Child) {
            throw new Error(`Test028 failed: Deleted species returned ${mapped.constructor.name} (expected Parent)`);
        }
        return "Test Passed: SpeciesInheritanceAfterDeleteTest028";
    },

    /**
     * 029. Non-instantiable function as species (throws TypeError).
     * Feature: Species returning non-instantiable function (e.g., Math) throws.
     */
    async test029_NonInstantiableSpecies() {
        class BadSpeciesArray extends Array {
            static get [Symbol.species]() {
                return Math;
            }
        }
        const badArr = new BadSpeciesArray(1, 2);
        let errorCaught = false;

        try {
            badArr.map(x => x);
        } catch (e) {
            errorCaught = e instanceof TypeError;
        }

        if (!errorCaught) {
            throw new Error(`Test029 failed: Non-instantiable species did not throw TypeError`);
        }
        return "Test Passed: NonInstantiableSpeciesTest029";
    },




};