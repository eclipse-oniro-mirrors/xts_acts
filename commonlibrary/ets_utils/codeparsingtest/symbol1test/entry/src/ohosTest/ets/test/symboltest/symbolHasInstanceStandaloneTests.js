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
export const SymbolHasInstanceStandaloneTestUtils = {
    /**
     * 001. Custom instanceof behavior via Symbol.hasInstance.
     * Feature: Override [Symbol.hasInstance] to customize instanceof check.
     */
    async test001_CustomInstanceOfBehavior() {
        class CustomClass {
            static [Symbol.hasInstance](obj) {
                return obj?.type === "custom";
            }
        }

        const validObj = { type: "custom" };
        const invalidObj = { type: "normal" };

        if (!(validObj instanceof CustomClass) || invalidObj instanceof CustomClass) {
            throw new Error(`Test001 failed: Custom instanceof returned valid=${validObj instanceof CustomClass}, invalid=${invalidObj instanceof CustomClass} (expected true, false)`);
        }
        return "Test Passed: CustomInstanceOfBehaviorTest001";
    },

    /**
     * 002. Default instanceof behavior (without Symbol.hasInstance override).
     * Feature: Native instanceof works when [Symbol.hasInstance] is not overridden.
     */
    async test002_DefaultInstanceOfBehavior() {
        class DefaultClass {}
        const instance = new DefaultClass();
        const nonInstance = {};

        if (!(instance instanceof DefaultClass) || nonInstance instanceof DefaultClass) {
            throw new Error(`Test002 failed: Default instanceof returned instance=${instance instanceof DefaultClass}, nonInstance=${nonInstance instanceof DefaultClass} (expected true, false)`);
        }
        return "Test Passed: DefaultInstanceOfBehaviorTest002";
    },

    /**
     * 003. Symbol.hasInstance is non-writable.
     * Feature: [Symbol.hasInstance] property of constructor is non-writable.
     */
    async test003_SymbolHasInstanceNonWritable() {
        class TestClass {}
        const original = TestClass[Symbol.hasInstance];

        try {
            TestClass[Symbol.hasInstance] = () => false;
        } catch (e) {

        }

        if (TestClass[Symbol.hasInstance] !== original) {
            throw new Error(`Test003 failed: Symbol.hasInstance was overwritten (non-writable expected)`);
        }
        return "Test Passed: SymbolHasInstanceNonWritableTest003";
    },



    /**
     * 005. Symbol.hasInstance is non-configurable.
     * Feature: [Symbol.hasInstance] property of constructor is non-configurable.
     */
    async test005_SymbolHasInstanceNonConfigurable() {
        class TestClass {}
        const descriptor = Object.getOwnPropertyDescriptor(TestClass, Symbol.hasInstance);

        if (descriptor?.configurable !== undefined) {
            throw new Error(`Test005 failed: Symbol.hasInstance configurable=${descriptor?.configurable} (expected undefined)`);
        }
        return "Test Passed: SymbolHasInstanceNonConfigurableTest005";
    },

    /**
     * 006. Symbol.hasInstance checks for object type (rejects non-objects).
     * Feature: Custom [Symbol.hasInstance] should handle non-object inputs gracefully.
     */
    async test006_SymbolHasInstanceNonObjectInput() {
        class ObjectCheckClass {
            static [Symbol.hasInstance](obj) {
                return typeof obj === "object" && obj !== null;
            }
        }

        const strInput = "string";
        const numInput = 123;
        const nullInput = null;
        const objInput = {};

        if (strInput instanceof ObjectCheckClass || numInput instanceof ObjectCheckClass || nullInput instanceof ObjectCheckClass || !(objInput instanceof ObjectCheckClass)) {
            throw new Error(`Test006 failed: Non-object input check returned str=${strInput instanceof ObjectCheckClass}, num=${numInput instanceof ObjectCheckClass}, null=${nullInput instanceof ObjectCheckClass}, obj=${objInput instanceof ObjectCheckClass} (expected false, false, false, true)`);
        }
        return "Test Passed: SymbolHasInstanceNonObjectInputTest006";
    },

    /**
     * 007. Subclass inherits parent's Symbol.hasInstance.
     * Feature: Subclass uses parent's [Symbol.hasInstance] if not overridden.
     */
    async test007_SubclassInheritsSymbolHasInstance() {
        class ParentClass {
            static [Symbol.hasInstance](obj) {
                return obj?.isParent === true;
            }
        }
        class ChildClass extends ParentClass {}

        const validObj = { isParent: true };
        if (!(validObj instanceof ChildClass)) {
            throw new Error(`Test007 failed: Subclass did not inherit parent's Symbol.hasInstance (expected true)`);
        }
        return "Test Passed: SubclassInheritsSymbolHasInstanceTest007";
    },

    /**
     * 008. Symbol.hasInstance works with built-in constructors (read-only).
     * Feature: Built-in constructors (e.g., Array) have non-writable [Symbol.hasInstance].
     */
    async test008_BuiltInConstructorSymbolHasInstance() {
        const original = Array[Symbol.hasInstance];
        const arr = [1, 2, 3];
        const nonArr = {};

        try {
            Array[Symbol.hasInstance] = () => false;
        } catch (e) {}

        if (Array[Symbol.hasInstance] !== original || !(arr instanceof Array) || nonArr instanceof Array) {
            throw new Error(`Test008 failed: Built-in Symbol.hasInstance was modified or invalid check (expected original, true, false)`);
        }
        return "Test Passed: BuiltInConstructorSymbolHasInstanceTest008";
    },

    /**
     * 009. Symbol.hasInstance as function parameter (type check).
     * Feature: Custom [Symbol.hasInstance] can implement complex type checks.
     */
    async test009_SymbolHasInstanceComplexCheck() {
        class NumberCheckClass {
            static [Symbol.hasInstance](obj) {
                return typeof obj === "number" || (obj instanceof Number);
            }
        }

        const numPrimitive = 42;
        const numObject = new Number(42);
        const str = "42";

        if (!(numPrimitive instanceof NumberCheckClass) || !(numObject instanceof NumberCheckClass) || str instanceof NumberCheckClass) {
            throw new Error(`Test009 failed: Complex check returned primitive=${numPrimitive instanceof NumberCheckClass}, object=${numObject instanceof NumberCheckClass}, str=${str instanceof NumberCheckClass} (expected true, true, false)`);
        }
        return "Test Passed: SymbolHasInstanceComplexCheckTest009";
    },

    /**
     * 010. Symbol.hasInstance override ignores prototype chain.
     * Feature: Custom [Symbol.hasInstance] overrides prototype-based instanceof check.
     */
    async test010_SymbolHasInstanceIgnoresPrototype() {
        class PrototypeClass {}
        class OverrideClass {
            static [Symbol.hasInstance](obj) {
                return false;
            }
        }

        const instance = new PrototypeClass();
        Object.setPrototypeOf(instance, OverrideClass.prototype);

        if (instance instanceof OverrideClass) {
            throw new Error(`Test010 failed: Custom Symbol.hasInstance did not ignore prototype chain (expected false)`);
        }
        return "Test Passed: SymbolHasInstanceIgnoresPrototypeTest010";
    },

    /**
     * 011. Symbol.hasInstance returns boolean (non-boolean is coerced).
     * Feature: Return value of [Symbol.hasInstance] is coerced to boolean.
     */
    async test011_SymbolHasInstanceBooleanCoercion() {
        class CoercionClass {
            static [Symbol.hasInstance]() {
                return "non-boolean";
            }
        }
        class FalsyCoercionClass {
            static [Symbol.hasInstance]() {
                return 0;
            }
        }

        const result1 = {} instanceof CoercionClass;
        const result2 = {} instanceof FalsyCoercionClass;

        if (!result1 || result2) {
            throw new Error(`Test011 failed: Boolean coercion returned (${result1}, ${result2}) (expected true, false)`);
        }
        return "Test Passed: SymbolHasInstanceBooleanCoercionTest011";
    },


    /**
     * 013. Subclass overrides parent's Symbol.hasInstance.
     * Feature: Subclass can override inherited [Symbol.hasInstance].
     */
    async test013_SubclassOverrideSymbolHasInstance() {
        class Parent {
            static [Symbol.hasInstance]() {
                return false;
            }
        }
        class Child extends Parent {
            static [Symbol.hasInstance]() {
                return true;
            }
        }

        const result = {} instanceof Child;
        if (!result) {
            throw new Error(`Test013 failed: Subclass override returned ${result} (expected true)`);
        }
        return "Test Passed: SubclassOverrideSymbolHasInstanceTest013";
    },

    /**
     * 014. Symbol.hasInstance handles null/undefined gracefully.
     * Feature: Custom [Symbol.hasInstance] can explicitly handle null/undefined.
     */
    async test014_SymbolHasInstanceNullUndefined() {
        class NullCheckClass {
            static [Symbol.hasInstance](obj) {
                return obj === null || obj === undefined;
            }
        }

        const resultNull = null instanceof NullCheckClass;
        const resultUndefined = undefined instanceof NullCheckClass;
        const resultObj = {} instanceof NullCheckClass;

        if (!resultNull || !resultUndefined || resultObj) {
            throw new Error(`Test014 failed: Null/undefined check returned (${resultNull}, ${resultUndefined}, ${resultObj}) (expected true, true, false)`);
        }
        return "Test Passed: SymbolHasInstanceNullUndefinedTest014";
    },



    /**
     * 016. Symbol.hasInstance checks array-like objects.
     * Feature: Custom logic can identify array-like objects via instanceof.
     */
    async test016_SymbolHasInstanceArrayLike() {
        class ArrayLikeClass {
            static [Symbol.hasInstance](obj) {
                return typeof obj === "object" && obj !== null && "length" in obj && typeof obj.length === "number";
            }
        }

        const arrayLike = { length: 3 };
        const nonArrayLike = { noLength: true };
        const realArray = [1, 2, 3];

        if (!(arrayLike instanceof ArrayLikeClass) || nonArrayLike instanceof ArrayLikeClass || !(realArray instanceof ArrayLikeClass)) {
            throw new Error(`Test016 failed: Array-like check returned (${arrayLike instanceof ArrayLikeClass}, ${nonArrayLike instanceof ArrayLikeClass}, ${realArray instanceof ArrayLikeClass}) (expected true, false, true)`);
        }
        return "Test Passed: SymbolHasInstanceArrayLikeTest016";
    },

    /**
     * 017. Symbol.hasInstance is static-only (instance property ignored).
     * Feature: [Symbol.hasInstance] on instance has no effect on instanceof.
     */
    async test017_SymbolHasInstanceInstanceProperty() {
        class InstancePropClass {
            [Symbol.hasInstance]() {
                return true;
            }
        }

        const instance = new InstancePropClass();
        const result = {} instanceof InstancePropClass;

        if (result) {
            throw new Error(`Test017 failed: Instance [Symbol.hasInstance] affected check (expected false)`);
        }
        return "Test Passed: SymbolHasInstanceInstancePropertyTest017";
    },

    /**
     * 018. Symbol.hasInstance with multi-level inheritance.
     * Feature: Multi-level subclass inherits top-level [Symbol.hasInstance] if not overridden.
     */
    async test018_SymbolHasInstanceMultiLevelInheritance() {
        class Grandparent {
            static [Symbol.hasInstance](obj) {
                return obj?.level === "grandparent";
            }
        }
        class Parent extends Grandparent {}
        class Child extends Parent {}

        const validObj = { level: "grandparent" };
        const result = validObj instanceof Child;

        if (!result) {
            throw new Error(`Test018 failed: Multi-level inheritance check returned ${result} (expected true)`);
        }
        return "Test Passed: SymbolHasInstanceMultiLevelInheritanceTest018";
    },

    /**
     * 019. Symbol.hasInstance in strict mode (behavior consistent).
     * Feature: [Symbol.hasInstance] behavior is same in strict/non-strict mode.
     */
    async test019_SymbolHasInstanceStrictMode() {
        "use strict";
        class StrictClass {
            static [Symbol.hasInstance](obj) {
                return obj?.strict === true;
            }
        }

        const validObj = { strict: true };
        const result = validObj instanceof StrictClass;

        if (!result) {
            throw new Error(`Test019 failed: Strict mode check returned ${result} (expected true)`);
        }
        return "Test Passed: SymbolHasInstanceStrictModeTest019";
    },

    /**
     * 020. Symbol.hasInstance checks frozen objects.
     * Feature: Custom logic works with Object.frozen() objects.
     */
    async test020_SymbolHasInstanceFrozenObject() {
        class FrozenCheckClass {
            static [Symbol.hasInstance](obj) {
                return Object.isFrozen(obj);
            }
        }

        const frozenObj = Object.freeze({});
        const nonFrozenObj = {};

        if (!(frozenObj instanceof FrozenCheckClass) || nonFrozenObj instanceof FrozenCheckClass) {
            throw new Error(`Test020 failed: Frozen object check returned (${frozenObj instanceof FrozenCheckClass}, ${nonFrozenObj instanceof FrozenCheckClass}) (expected true, false)`);
        }
        return "Test Passed: SymbolHasInstanceFrozenObjectTest020";
    },

    /**
     * 021. Symbol.hasInstance dynamic condition (depends on external state).
     * Feature: [Symbol.hasInstance] can use external state for dynamic checks.
     */
    async test021_SymbolHasInstanceDynamicCondition() {
        let allowCheck = false;
        class DynamicClass {
            static [Symbol.hasInstance](obj) {
                return allowCheck && obj?.dynamic === true;
            }
        }

        const validObj = { dynamic: true };
        let result1 = validObj instanceof DynamicClass;
        allowCheck = true;
        let result2 = validObj instanceof DynamicClass;

        if (result1 || !result2) {
            throw new Error(`Test021 failed: Dynamic condition returned (${result1}, ${result2}) (expected false, true)`);
        }
        return "Test Passed: SymbolHasInstanceDynamicConditionTest021";
    },

    /**
     * 022. Symbol.hasInstance with Object.prototype.toString integration.
     * Feature: Combine with Object.prototype.toString for precise type check.
     */
    async test022_SymbolHasInstanceWithToString() {
        class PreciseTypeClass {
            static [Symbol.hasInstance](obj) {
                return Object.prototype.toString.call(obj) === "[object Date]";
            }
        }

        const dateObj = new Date();
        const nonDateObj = {};

        if (!(dateObj instanceof PreciseTypeClass) || nonDateObj instanceof PreciseTypeClass) {
            throw new Error(`Test022 failed: ToString integration check returned (${dateObj instanceof PreciseTypeClass}, ${nonDateObj instanceof PreciseTypeClass}) (expected true, false)`);
        }
        return "Test Passed: SymbolHasInstanceWithToStringTest022";
    },

    /**
     * 023. Symbol.hasInstance cannot be deleted (non-configurable).
     * Feature: [Symbol.hasInstance] is non-configurable, cannot be deleted.
     */
    async test023_SymbolHasInstanceNonDeletable() {
        class DeletableCheckClass {}
        const original = DeletableCheckClass[Symbol.hasInstance];

        try {
            delete DeletableCheckClass[Symbol.hasInstance];
        } catch (e) {}

        if (DeletableCheckClass[Symbol.hasInstance] !== original) {
            throw new Error(`Test023 failed: [Symbol.hasInstance] was deleted (expected non-deletable)`);
        }
        return "Test Passed: SymbolHasInstanceNonDeletableTest023";
    },

    /**
     * 024. Symbol.hasInstance handles circular reference objects.
     * Feature: Custom logic works with objects having circular references.
     */
    async test024_SymbolHasInstanceCircularReference() {
        class CircularCheckClass {
            static [Symbol.hasInstance](obj) {
                return obj?.hasCircular === true;
            }
        }

        const circularObj = { hasCircular: true };
        circularObj.self = circularObj;

        const result = circularObj instanceof CircularCheckClass;
        if (!result) {
            throw new Error(`Test024 failed: Circular reference check returned ${result} (expected true)`);
        }
        return "Test Passed: SymbolHasInstanceCircularReferenceTest024";
    },

    /**
     * 025. Symbol.hasInstance with built-in Error types.
     * Feature: Custom check for specific built-in Error subclasses.
     */
    async test025_SymbolHasInstanceBuiltInError() {
        class TypeErrorCheckClass {
            static [Symbol.hasInstance](obj) {
                return obj instanceof TypeError;
            }
        }

        const typeError = new TypeError("test");
        const rangeError = new RangeError("test");

        if (!(typeError instanceof TypeErrorCheckClass) || rangeError instanceof TypeErrorCheckClass) {
            throw new Error(`Test025 failed: Built-in Error check returned (${typeError instanceof TypeErrorCheckClass}, ${rangeError instanceof TypeErrorCheckClass}) (expected true, false)`);
        }
        return "Test Passed: SymbolHasInstanceBuiltInErrorTest025";
    },

    /**
     * 026. Symbol.hasInstance as regular function (not class static).
     * Feature: Non-class objects can have [Symbol.hasInstance] for instanceof.
     */
    async test026_SymbolHasInstanceNonClassObject() {
        const nonClassObj = {
            [Symbol.hasInstance](obj) {
                return obj?.isNonClass === true;
            }
        };

        const validObj = { isNonClass: true };
        const result = validObj instanceof nonClassObj;

        if (!result) {
            throw new Error(`Test026 failed: Non-class [Symbol.hasInstance] returned ${result} (expected true)`);
        }
        return "Test Passed: SymbolHasInstanceNonClassObjectTest026";
    },

    /**
     * 027. Symbol.hasInstance批量验证多个实例.
     * Feature: Custom logic supports batch instance validation.
     */
    async test027_SymbolHasInstanceBatchCheck() {
        class BatchCheckClass {
            static [Symbol.hasInstance](obj) {
                return typeof obj === "number" && obj > 10;
            }
        }

        const instances = [15, 5, 20, "12", 30];
        const validResults = instances.filter(obj => obj instanceof BatchCheckClass);
        const expected = [15, 20, 30];

        if (JSON.stringify(validResults) !== JSON.stringify(expected)) {
            throw new Error(`Test027 failed: Batch check returned [${validResults}] (expected [${expected}])`);
        }
        return "Test Passed: SymbolHasInstanceBatchCheckTest027";
    },


    /**
     * 029. Symbol.hasInstance with subclass prototype modification.
     * Feature: Subclass prototype modification doesn't affect custom [Symbol.hasInstance].
     */
    async test029_SymbolHasInstanceSubclassPrototypeModify() {
        class Parent {
            static [Symbol.hasInstance](obj) {
                return obj?.flag === true;
            }
        }
        class Child extends Parent {}

        Object.setPrototypeOf(Child.prototype, {});
        const validObj = { flag: true };
        const result = validObj instanceof Child;

        if (!result) {
            throw new Error(`Test029 failed: Subclass prototype modification broke check (expected true)`);
        }
        return "Test Passed: SymbolHasInstanceSubclassPrototypeModifyTest029";
    },

    /**
     * 030. Symbol.hasInstance with optional chaining in condition.
     * Feature: Custom logic can use optional chaining to avoid TypeError.
     */
    async test030_SymbolHasInstanceOptionalChaining() {
        class OptionalChainClass {
            static [Symbol.hasInstance](obj) {
                return obj?.nested?.value === "valid";
            }
        }

        const validObj = { nested: { value: "valid" } };
        const invalidObj = { nested: null };
        const noNestedObj = {};

        const result1 = validObj instanceof OptionalChainClass;
        const result2 = invalidObj instanceof OptionalChainClass;
        const result3 = noNestedObj instanceof OptionalChainClass;

        if (!result1 || result2 || result3) {
            throw new Error(`Test030 failed: Optional chaining check returned (${result1}, ${result2}, ${result3}) (expected true, false, false)`);
        }
        return "Test Passed: SymbolHasInstanceOptionalChainingTest030";
    }
};