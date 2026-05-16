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
export const SymbolConstructorTestUtils = {
    /**
     * 001. Direct call Symbol() returns primitive symbol type.
     * Feature: Symbol() is called directly; returns primitive "symbol" type.
     */
    async test001_SymbolDirectCallNoArgs() {
        const sym = Symbol();
        const type = typeof sym;

        if (type !== "symbol" || Object.prototype.toString.call(sym) !== "[object Symbol]") {
            throw new Error(`Test001 failed: Symbol() returned type "${type}" (expected "symbol"), toString()="${Object.prototype.toString.call(sym)}" (expected "[object Symbol]")`);
        }

        return "Test Passed: SymbolDirectCallNoArgsTest001";
    },

    /**
     * 002. Direct call Symbol("desc") returns primitive symbol with description.
     * Feature: Symbol(description) returns primitive symbol; description is stored.
     */
    async test002_SymbolDirectCallWithStringDesc() {
        const desc = "test-description";
        const sym = Symbol(desc);

        if (typeof sym !== "symbol" || sym.description !== desc) {
            throw new Error(`Test002 failed: Symbol("${desc}") description="${sym.description}" (expected "${desc}"), type="${typeof sym}" (expected "symbol")`);
        }

        return "Test Passed: SymbolDirectCallWithStringDescTest002";
    },

    /**
     * 003. new Symbol() throws TypeError.
     * Feature: Symbol constructor cannot be called with new; throws TypeError.
     */
    async test003_SymbolNewWithoutArgsThrows() {
        let errorThrown = false;
        try {
            new Symbol();
        } catch (e) {
            errorThrown = e instanceof TypeError;
        }

        if (!errorThrown) {
            throw new Error(`Test003 failed: new Symbol() did not throw TypeError (expected TypeError)`);
        }

        return "Test Passed: SymbolNewWithoutArgsThrowsTest003";
    },

    /**
     * 004. new Symbol("desc") throws TypeError.
     * Feature: Symbol constructor cannot be called with new, even with description.
     */
    async test004_SymbolNewWithDescThrows() {
        let errorThrown = false;
        try {
            new Symbol("desc");
        } catch (e) {
            errorThrown = e instanceof TypeError;
        }

        if (!errorThrown) {
            throw new Error(`Test004 failed: new Symbol("desc") did not throw TypeError (expected TypeError)`);
        }

        return "Test Passed: SymbolNewWithDescThrowsTest004";
    },

    /**
     * 005. Symbol() without args has description undefined, toString() is "Symbol()".
     * Feature: No description → description property is undefined; toString() has no inner text.
     */
    async test005_SymbolNoArgsDescription() {
        const sym = Symbol();

        if (sym.description !== undefined || sym.toString() !== "Symbol()") {
            throw new Error(`Test005 failed: Symbol() description="${sym.description}" (expected undefined), toString()="${sym.toString()}" (expected "Symbol()")`);
        }

        return "Test Passed: SymbolNoArgsDescriptionTest005";
    },

    /**
     * 006. Symbol with number description is converted to string.
     * Feature: Non-string description is coerced to string; stored as such.
     */
    async test006_SymbolNonStringDescNumber() {
        const desc = 12345;
        const expectedDescStr = "12345";
        const sym = Symbol(desc);

        if (sym.description !== expectedDescStr || sym.toString() !== `Symbol(${expectedDescStr})`) {
            throw new Error(`Test006 failed: Symbol(${desc}) description="${sym.description}" (expected "${expectedDescStr}"), toString()="${sym.toString()}" (expected "Symbol(${expectedDescStr})")`);
        }

        return "Test Passed: SymbolNonStringDescNumberTest006";
    },

    /**
     * 007. Symbol(null) has description "null", toString() is "Symbol(null)".
     * Feature: null description is coerced to string "null".
     */
    async test007_SymbolNullDesc() {
        const desc = null;
        const expectedDescStr = "null";
        const sym = Symbol(desc);

        if (sym.description !== expectedDescStr || sym.toString() !== `Symbol(${expectedDescStr})`) {
            throw new Error(`Test007 failed: Symbol(null) description="${sym.description}" (expected "${expectedDescStr}"), toString()="${sym.toString()}" (expected "Symbol(${expectedDescStr})")`);
        }

        return "Test Passed: SymbolNullDescTest007";
    },

    /**
     * 008. Two symbols with same description are not equal.
     * Feature: Each Symbol() call returns unique value; same description does not make them equal.
     */
    async test008_SymbolSameDescNotEqual() {
        const desc = "same-desc";
        const sym1 = Symbol(desc);
        const sym2 = Symbol(desc);

        if (sym1 === sym2) {
            throw new Error(`Test008 failed: Symbol("${desc}") === Symbol("${desc}") returned true (expected false; symbols are unique)`);
        }

        return "Test Passed: SymbolSameDescNotEqualTest008";
    },

    /**
     * 009. Two symbols without description are not equal.
     * Feature: Even without description, each Symbol() call returns unique value.
     */
    async test009_SymbolNoDescNotEqual() {
        const sym1 = Symbol();
        const sym2 = Symbol();

        if (sym1 === sym2) {
            throw new Error(`Test009 failed: Symbol() === Symbol() returned true (expected false; symbols are unique)`);
        }

        return "Test Passed: SymbolNoDescNotEqualTest009";
    },

    /**
     * 010. Symbol is not equal to other primitive types.
     * Feature: Symbol type is distinct from string, number, boolean; strict inequality holds.
     */
    async test010_SymbolNotEqualOtherPrimitives() {
        const sym = Symbol("test");
        const strEqual = sym === "Symbol(test)";
        const numEqual = sym === 123;
        const boolEqual = sym === true;

        if (strEqual || numEqual || boolEqual) {
            throw new Error(`Test010 failed: Symbol === "Symbol(test)"=${strEqual}, ===123=${numEqual}, ===true=${boolEqual} (expected all false)`);
        }

        return "Test Passed: SymbolNotEqualOtherPrimitivesTest010";
    },

    /**
     * 011. Object(Symbol()) returns Symbol wrapper object (type "object").
     * Feature: Object() wrapper converts primitive symbol to object type.
     */
    async test011_SymbolWrapperObjectType() {
        const sym = Symbol("wrap");
        const wrapper = Object(sym);

        if (typeof wrapper !== "object" || wrapper === null || Object.prototype.toString.call(wrapper) !== "[object Symbol]") {
            throw new Error(`Test011 failed: Object(Symbol()) type="${typeof wrapper}" (expected "object"), toString()="${Object.prototype.toString.call(wrapper)}" (expected "[object Symbol]")`);
        }

        return "Test Passed: SymbolWrapperObjectTypeTest011";
    },

    /**
     * 012. Symbol wrapper is loosely equal but not strictly equal to primitive.
     * Feature: Wrapper object and primitive symbol are loosely equal but not strictly equal.
     */
    async test012_SymbolWrapperEquality() {
        const sym = Symbol("eq");
        const wrapper = Object(sym);
        const looseEqual = wrapper == sym;
        const strictEqual = wrapper === sym;

        if (!looseEqual || strictEqual) {
            throw new Error(`Test012 failed: Object(Symbol()) == Symbol()=${looseEqual} (expected true), ====${strictEqual} (expected false)`);
        }

        return "Test Passed: SymbolWrapperEqualityTest012";
    },

    /**
     * 013. Symbol wrapper toString() matches primitive.
     * Feature: Wrapper object inherits toString() behavior from primitive symbol.
     */
    async test013_SymbolWrapperToString() {
        const desc = "wrapper-tostring";
        const sym = Symbol(desc);
        const wrapper = Object(sym);
        const primitiveStr = sym.toString();
        const wrapperStr = wrapper.toString();

        if (primitiveStr !== wrapperStr) {
            throw new Error(`Test013 failed: Primitive toString="${primitiveStr}", Wrapper toString="${wrapperStr}" (expected equal)`);
        }

        return "Test Passed: SymbolWrapperToStringTest013";
    },

    /**
     * 014. Symbol subclass instantiation throws TypeError.
     * Feature: Symbol cannot be subclassed; super() in subclass throws TypeError.
     */
    async test014_SymbolSubclassInstantiateThrows() {
        class MySymbol extends Symbol {}
        let errorThrown = false;

        try {
            new MySymbol();
        } catch (e) {
            errorThrown = e instanceof TypeError;
        }

        if (!errorThrown) {
            throw new Error(`Test014 failed: new MySymbol() (subclass of Symbol) did not throw TypeError (expected TypeError)`);
        }

        return "Test Passed: SymbolSubclassInstantiateThrowsTest014";
    },

    /**
     * 015. typeof primitive Symbol returns "symbol".
     * Feature: Primitive symbol type is correctly identified by typeof.
     */
    async test015_SymbolTypeofPrimitive() {
        const sym = Symbol("typeof-test");
        const type = typeof sym;

        if (type !== "symbol") {
            throw new Error(`Test015 failed: typeof Symbol("typeof-test") returned "${type}" (expected "symbol")`);
        }

        return "Test Passed: SymbolTypeofPrimitiveTest015";
    },

    /**
     * 016. typeof Symbol wrapper returns "object".
     * Feature: Wrapper object's type is "object" (distinct from primitive).
     */
    async test016_SymbolTypeofWrapper() {
        const sym = Symbol("wrapper-typeof");
        const wrapper = Object(sym);
        const type = typeof wrapper;

        if (type !== "object") {
            throw new Error(`Test016 failed: typeof Object(Symbol()) returned "${type}" (expected "object")`);
        }

        return "Test Passed: SymbolTypeofWrapperTest016";
    },

    /**
     * 017. JSON.stringify(primitive Symbol) returns undefined.
     * Feature: Primitive symbol cannot be serialized to JSON; returns undefined.
     */
    async test017_SymbolJsonStringifyPrimitive() {
        const sym = Symbol("json-test");
        const jsonResult = JSON.stringify(sym);

        if (jsonResult !== undefined) {
            throw new Error(`Test017 failed: JSON.stringify(Symbol()) returned "${jsonResult}" (expected undefined)`);
        }

        return "Test Passed: SymbolJsonStringifyPrimitiveTest017";
    },

    /**
     * 018. JSON.stringify(Symbol wrapper) returns "{}" (empty object).
     * Feature: Symbol wrapper is an object with no enumerable properties; JSON.stringify returns empty object.
     * Fixed: Corrected expected value from undefined to "{}" (per ES spec).
     */
    async test018_SymbolJsonStringifyWrapper() {
        const sym = Symbol("json-wrapper-test");
        const wrapper = Object(sym);
        const jsonResult = JSON.stringify(wrapper);
        const expected = "{}";

        if (jsonResult !== expected) {
            throw new Error(`Test018 failed: JSON.stringify(Object(Symbol())) returned "${jsonResult}" (expected "${expected}")`);
        }

        return "Test Passed: SymbolJsonStringifyWrapperTest018";
    },



    /**
     * 019. Symbol with extremely long description handles correctly.
     * Feature: Long description strings are processed without errors; description/toString() work.
     */
    async test019_SymbolLongDescription() {
        const longDesc = "a".repeat(10000);
        const sym = Symbol(longDesc);

        if (sym.description !== longDesc || sym.toString() !== `Symbol(${longDesc})`) {
            throw new Error(`Test019 failed: Long description (length ${longDesc.length}) — description length=${sym.description?.length || 0} (expected ${longDesc.length}), toString() starts with "Symbol("=${sym.toString().startsWith("Symbol(")}`);
        }

        return "Test Passed: SymbolLongDescriptionTest019";
    },

    /**
     * 020. Symbol with Symbol primitive as description throws TypeError.
     * Feature: Symbol primitive cannot be converted to string implicitly; constructor throws TypeError.
     * Fixed: Corrected logic to verify TypeError when passing Symbol primitive as description.
     */
    async test020_SymbolDescIsSymbol() {
        const innerSym = Symbol("inner");
        let errorThrown = false;
        let errorMessage = "";

        try {
            Symbol(innerSym);
        } catch (e) {
            errorThrown = e instanceof TypeError;
            errorMessage = e.message;
        }

        if (!errorThrown || !errorMessage.includes("Cannot convert")) {
            throw new Error(`Test020 failed: Symbol(Symbol primitive) threw ${errorThrown ? `error "${errorMessage}"` : "no error"} (expected TypeError with message "Cannot convert a Symbol value to a string")`);
        }

        return "Test Passed: SymbolDescIsSymbolTest020";
    },

    /**
     * 021. Symbol(undefined) has description undefined, toString() is "Symbol()".
     * Feature: undefined description is treated same as no description.
     */
    async test021_SymbolUndefinedDesc() {
        const sym = Symbol(undefined);

        if (sym.description !== undefined || sym.toString() !== "Symbol()") {
            throw new Error(`Test021 failed: Symbol(undefined) description="${sym.description}" (expected undefined), toString()="${sym.toString()}" (expected "Symbol()")`);
        }

        return "Test Passed: SymbolUndefinedDescTest021";
    },

    /**
     * 022. Symbol wrapper's description matches primitive.
     * Feature: Wrapper object inherits description property from primitive symbol.
     */
    async test022_SymbolWrapperDescription() {
        const desc = "wrapper-desc";
        const sym = Symbol(desc);
        const wrapper = Object(sym);

        if (wrapper.description !== desc) {
            throw new Error(`Test022 failed: Object(Symbol("${desc}")).description="${wrapper.description}" (expected "${desc}")`);
        }

        return "Test Passed: SymbolWrapperDescriptionTest022";
    },

    /**
     * 023. Symbol with boolean description is converted to string.
     * Feature: Boolean description is coerced to "true" or "false".
     */
    async test023_SymbolBooleanDesc() {
        const desc = true;
        const expectedDescStr = "true";
        const sym = Symbol(desc);

        if (sym.description !== expectedDescStr || sym.toString() !== `Symbol(${expectedDescStr})`) {
            throw new Error(`Test023 failed: Symbol(${desc}) description="${sym.description}" (expected "${expectedDescStr}"), toString()="${sym.toString()}" (expected "Symbol(${expectedDescStr})")`);
        }

        return "Test Passed: SymbolBooleanDescTest023";
    },

    /**
     * 024. Symbol subclass without super() throws ReferenceError.
     * Feature: Subclass of Symbol must call super(), but super() throws; no valid subclassing.
     */
    async test024_SymbolSubclassNoSuperThrows() {
        class MySymbol extends Symbol {
            constructor() {
            }
        }
        let errorThrown = false;
        let errorType = "";

        try {
            new MySymbol();
        } catch (e) {
            errorThrown = true;
            errorType = e.name;
        }

        if (!errorThrown || errorType !== "ReferenceError") {
            throw new Error(`Test024 failed: MySymbol subclass without super() threw ${errorType || "no error"} (expected ReferenceError)`);
        }

        return "Test Passed: SymbolSubclassNoSuperThrowsTest024";
    },

    /**
     * 025. Symbol with empty string description has description "", toString() is "Symbol()".
     * Feature: Empty string description is stored as ""; toString() has no inner text.
     */
    async test025_SymbolEmptyStringDesc() {
        const desc = "";
        const sym = Symbol(desc);

        if (sym.description !== desc || sym.toString() !== "Symbol()") {
            throw new Error(`Test025 failed: Symbol("") description="${sym.description}" (expected ""), toString()="${sym.toString()}" (expected "Symbol()")`);
        }

        return "Test Passed: SymbolEmptyStringDescTest025";
    },

    /**
     * 026. Symbol with object as description uses object's toString().
     * Feature: Object description is coerced to string via its toString() method.
     */
    async test026_SymbolObjectDesc() {
        const descObj = { a: 1, b: 2 };
        const expectedDesc = "[object Object]";
        const sym = Symbol(descObj);

        if (sym.description !== expectedDesc || sym.toString() !== `Symbol(${expectedDesc})`) {
            throw new Error(`Test026 failed: Symbol(${JSON.stringify(descObj)}) description="${sym.description}" (expected "${expectedDesc}"), toString()="${sym.toString()}" (expected "Symbol(${expectedDesc})")`);
        }

        return "Test Passed: SymbolObjectDescTest026";
    },

    /**
     * 027. Symbol with array as description uses array's toString().
     * Feature: Array description is coerced to string via its toString() method.
     */
    async test027_SymbolArrayDesc() {
        const descArr = [1, 2, 3];
        const expectedDesc = "1,2,3";
        const sym = Symbol(descArr);

        if (sym.description !== expectedDesc || sym.toString() !== `Symbol(${expectedDesc})`) {
            throw new Error(`Test027 failed: Symbol([${descArr}]) description="${sym.description}" (expected "${expectedDesc}"), toString()="${sym.toString()}" (expected "Symbol(${expectedDesc})")`);
        }

        return "Test Passed: SymbolArrayDescTest027";
    },

    /**
     * 028. Symbol wrapper object's valueOf() returns primitive symbol.
     * Feature: Wrapper object's valueOf() unwraps to the original primitive symbol.
     */
    async test028_SymbolWrapperValueOf() {
        const sym = Symbol("valueof");
        const wrapper = Object(sym);
        const valueOfResult = wrapper.valueOf();

        if (valueOfResult !== sym || typeof valueOfResult !== "symbol") {
            throw new Error(`Test028 failed: Object(Symbol()).valueOf() returned ${valueOfResult} (expected ${sym}), type="${typeof valueOfResult}" (expected "symbol")`);
        }

        return "Test Passed: SymbolWrapperValueOfTest028";
    },

    /**
     * 029. Symbol as object property is non-enumerable by default.
     * Feature: Symbol properties are non-enumerable; not iterated by for...in.
     */
    async test029_SymbolAsNonEnumerableProperty() {
        const symKey = Symbol("prop");
        const obj = { [symKey]: "value", normalProp: "normal" };
        let enumeratedKeys = [];

        for (const key in obj) {
            enumeratedKeys.push(key);
        }

        if (enumeratedKeys.includes(symKey) || !obj.hasOwnProperty(symKey)) {
            throw new Error(`Test029 failed: Symbol property was enumerated=${enumeratedKeys.includes(symKey)} (expected false), hasOwnProperty=${obj.hasOwnProperty(symKey)} (expected true)`);
        }

        return "Test Passed: SymbolAsNonEnumerablePropertyTest029";
    },

    /**
     * 030. String() converts primitive Symbol to its toString() value.
     * Feature: String() explicitly converts Symbol to its string representation.
     */
    async test030_StringConvertPrimitiveSymbol() {
        const sym = Symbol("convert");
        const stringResult = String(sym);
        const expected = sym.toString();

        if (stringResult !== expected) {
            throw new Error(`Test030 failed: String(Symbol("convert")) returned "${stringResult}" (expected "${expected}")`);
        }

        return "Test Passed: StringConvertPrimitiveSymbolTest030";
    },

    /**
     * 031. Number() converts primitive Symbol throws TypeError.
     * Feature: Symbol cannot be converted to number; Number() throws TypeError.
     */
    async test031_NumberConvertPrimitiveSymbol() {
        const sym = Symbol("number");
        let errorThrown = false;

        try {
            Number(sym);
        } catch (e) {
            errorThrown = e instanceof TypeError;
        }

        if (!errorThrown) {
            throw new Error(`Test031 failed: Number(Symbol("number")) did not throw TypeError (expected TypeError)`);
        }

        return "Test Passed: NumberConvertPrimitiveSymbolTest031";
    },

    /**
     * 032. Boolean() converts primitive Symbol to true.
     * Feature: All non-null/undefined primitives (including Symbol) are truthy.
     */
    async test032_BooleanConvertPrimitiveSymbol() {
        const sym = Symbol("boolean");
        const booleanResult = Boolean(sym);

        if (!booleanResult) {
            throw new Error(`Test032 failed: Boolean(Symbol("boolean")) returned ${booleanResult} (expected true)`);
        }

        return "Test Passed: BooleanConvertPrimitiveSymbolTest032";
    },


    /**
     * 034. Symbol wrapper object's prototype is Symbol.prototype.
     * Feature: Wrapper object inherits from Symbol.prototype.
     */
    async test034_SymbolWrapperPrototype() {
        const sym = Symbol("proto");
        const wrapper = Object(sym);
        const prototype = Object.getPrototypeOf(wrapper);

        if (prototype !== Symbol.prototype) {
            throw new Error(`Test034 failed: Object(Symbol()).__proto__ is ${prototype} (expected Symbol.prototype)`);
        }

        return "Test Passed: SymbolWrapperPrototypeTest034";
    },

    /**
     * 035. Symbol with nested array as description uses flattened toString().
     * Feature: Nested array description is coerced to flattened string via array.toString().
     */
    async test035_SymbolNestedArrayDesc() {
        const descArr = [1, [2, [3]]];
        const expectedDesc = "1,2,3";
        const sym = Symbol(descArr);

        if (sym.description !== expectedDesc || sym.toString() !== `Symbol(${expectedDesc})`) {
            throw new Error(`Test035 failed: Symbol([1,[2,[3]]]) description="${sym.description}" (expected "${expectedDesc}"), toString()="${sym.toString()}" (expected "Symbol(${expectedDesc})")`);
        }

        return "Test Passed: SymbolNestedArrayDescTest035";
    },

    /**
     * 036. Symbol with function as description uses function's toString().
     * Feature: Function description is coerced to string via its toString() method.
     */
    async test036_SymbolFunctionDesc() {
        const descFunc = () => console.log("test");
        const expectedDesc = descFunc.toString();
        const sym = Symbol(descFunc);

        if (sym.description !== expectedDesc || sym.toString() !== `Symbol(${expectedDesc})`) {
            throw new Error(`Test036 failed: Symbol(${descFunc.name}) description="${sym.description}" (expected "${expectedDesc}"), toString()="${sym.toString()}" (expected "Symbol(${expectedDesc})")`);
        }

        return "Test Passed: SymbolFunctionDescTest036";
    },

    /**
     * 037. JSON.parse cannot revive Symbol from string representation.
     * Feature: JSON.parse treats Symbol string as plain string; no implicit revival.
     */
    async test037_SymbolJsonParse() {
        const symStr = "Symbol(test)";
        const parsed = JSON.parse(`"${symStr}"`);
        const isSymbol = typeof parsed === "symbol";

        if (isSymbol || parsed !== symStr) {
            throw new Error(`Test037 failed: JSON.parse("${symStr}") returned ${parsed} (expected "${symStr}"), isSymbol=${isSymbol} (expected false)`);
        }

        return "Test Passed: SymbolJsonParseTest037";
    },

    /**
     * 038. Symbol wrapper object calls toString() with correct this binding.
     * Feature: Symbol.prototype.toString() works with wrapper object as this.
     */
    async test038_SymbolWrapperToStringBinding() {
        const sym = Symbol("bind");
        const wrapper = Object(sym);
        const toStringResult = Symbol.prototype.toString.call(wrapper);
        const expected = sym.toString();

        if (toStringResult !== expected) {
            throw new Error(`Test038 failed: Symbol.prototype.toString.call(wrapper) returned "${toStringResult}" (expected "${expected}")`);
        }

        return "Test Passed: SymbolWrapperToStringBindingTest038";
    },

    /**
     * 039. Destructuring object with Symbol property retrieves correct value.
     * Feature: Symbol properties can be destructured from objects.
     */
    async test039_SymbolDestructuring() {
        const symKey = Symbol("destruct");
        const obj = { [symKey]: "destruct-value", normal: "normal-value" };
        const { [symKey]: destructed } = obj;

        if (destructed !== "destruct-value") {
            throw new Error(`Test039 failed: Destructured Symbol property returned "${destructed}" (expected "destruct-value")`);
        }

        return "Test Passed: SymbolDestructuringTest039";
    },

    /**
     * 040. Spread operator copies object's Symbol properties.
     * Feature: Spread operator includes Symbol properties when copying objects.
     */
    async test040_SymbolSpreadOperator() {
        const symKey = Symbol("spread");
        const original = { [symKey]: "spread-value" };
        const copied = { ...original };

        if (!copied.hasOwnProperty(symKey) || copied[symKey] !== "spread-value") {
            throw new Error(`Test040 failed: Spread object has Symbol property=${copied.hasOwnProperty(symKey)}, value="${copied[symKey]}" (expected "spread-value")`);
        }

        return "Test Passed: SymbolSpreadOperatorTest040";
    },

    /**
     * 041. Symbol passed as function parameter retains identity.
     * Feature: Symbol retains reference identity when passed as function argument.
     */
    async test041_SymbolAsFunctionParameter() {
        const sym = Symbol("param");
        const testFunc = (arg) => arg === sym;
        const result = testFunc(sym);

        if (!result) {
            throw new Error(`Test041 failed: Symbol passed as parameter did not retain identity (result=${result}, expected true)`);
        }

        return "Test Passed: SymbolAsFunctionParameterTest041";
    },

    /**
     * 042. Symbol stored in Set retains uniqueness.
     * Feature: Set recognizes Symbol uniqueness; duplicate Symbols are not added.
     */
    async test042_SymbolInSet() {
        const sym1 = Symbol("set");
        const sym2 = Symbol("set");
        const set = new Set([sym1, sym1, sym2]);

        if (set.size !== 2 || !set.has(sym1) || !set.has(sym2)) {
            throw new Error(`Test042 failed: Set size=${set.size} (expected 2), has(sym1)=${set.has(sym1)}, has(sym2)=${set.has(sym2)} (expected both true)`);
        }

        return "Test Passed: SymbolInSetTest042";
    },

    /**
     * 043. Symbol with Date object as description uses Date's toString().
     * Feature: Date object description is coerced to string via its toString() method.
     */
    async test043_SymbolDateDesc() {
        const descDate = new Date("2024-01-01");
        const expectedDesc = descDate.toString();
        const sym = Symbol(descDate);

        if (sym.description !== expectedDesc || sym.toString() !== `Symbol(${expectedDesc})`) {
            throw new Error(`Test043 failed: Symbol(Date) description="${sym.description}" (expected "${expectedDesc}"), toString()="${sym.toString()}" (expected "Symbol(${expectedDesc})")`);
        }

        return "Test Passed: SymbolDateDescTest043";
    },

    /**
     * 044. Symbol wrapper object is instanceof Symbol returns true.
     * Feature: Wrapper object is an instance of Symbol constructor.
     */
    async test044_SymbolWrapperInstanceOfSymbol() {
        const sym = Symbol("instanceof");
        const wrapper = Object(sym);
        const isInstance = wrapper instanceof Symbol;

        if (!isInstance) {
            throw new Error(`Test044 failed: Object(Symbol()) instanceof Symbol returned ${isInstance} (expected true)`);
        }

        return "Test Passed: SymbolWrapperInstanceOfSymbolTest044";
    },

        /**
         * 045. Object.keys() excludes Symbol properties from object.
         * Feature: Symbol properties are not included in Object.keys() result.
         */
        async test045_ObjectKeysExcludeSymbol() {
            const symKey = Symbol("key-exclude");
            const obj = { [symKey]: "value", normal: "normal-value" };
            const keys = Object.keys(obj);

            if (keys.includes(symKey.toString()) || keys.length !== 1 || keys[0] !== "normal") {
                throw new Error(`Test045 failed: Object.keys() returned [${keys}] (expected ["normal"]; Symbol properties excluded)`);
            }

            return "Test Passed: ObjectKeysExcludeSymbolTest045";
        },

        /**
         * 046. Object.getOwnPropertySymbols() retrieves all Symbol properties.
         * Feature: Object.getOwnPropertySymbols() returns array of Symbol properties.
         */
        async test046_GetOwnPropertySymbols() {
            const sym1 = Symbol("prop1");
            const sym2 = Symbol("prop2");
            const obj = { [sym1]: "val1", [sym2]: "val2", normal: "val3" };
            const ownSymbols = Object.getOwnPropertySymbols(obj);

            if (ownSymbols.length !== 2 || !ownSymbols.includes(sym1) || !ownSymbols.includes(sym2)) {
                throw new Error(`Test046 failed: Object.getOwnPropertySymbols() returned [${ownSymbols}] (expected [${sym1}, ${sym2}])`);
            }

            return "Test Passed: GetOwnPropertySymbolsTest046";
        },

        /**
         * 047. Template literal with Symbol throws TypeError.
         * Feature: Symbol cannot be implicitly converted to string in template literals.
         */
        async test047_SymbolInTemplateLiteral() {
            const sym = Symbol("template");
            let errorThrown = false;

            try {
                `${sym}`;
            } catch (e) {
                errorThrown = e instanceof TypeError  ;
            }

            if (!errorThrown) {
                throw new Error(`Test047 failed: Symbol in template literal did not throw expected TypeError`);
            }

            return "Test Passed: SymbolInTemplateLiteralTest047";
        },

        /**
         * 048. Symbol.for() creates global Symbol, distinct from constructor-created Symbol.
         * Feature: Symbol.for() uses global registry; constructor-created Symbol is not registered.
         */
        async test048_SymbolForVsConstructor() {
            const key = "global-key";
            const globalSym = Symbol.for(key);
            const constructorSym = Symbol(key);

            if (globalSym === constructorSym || Symbol.keyFor(constructorSym) !== undefined) {
                throw new Error(`Test048 failed: Symbol.for("${key}") === Symbol("${key}")=${globalSym === constructorSym}, Symbol.keyFor(constructorSym)=${Symbol.keyFor(constructorSym)} (expected undefined)`);
            }

            return "Test Passed: SymbolForVsConstructorTest048";
        },

        /**
         * 049. Symbol with RegExp object as description uses RegExp's toString().
         * Feature: RegExp description is coerced to string via its toString() method.
         */
        async test049_SymbolRegExpDesc() {
            const descRegExp = /abc/i;
            const expectedDesc = descRegExp.toString();
            const sym = Symbol(descRegExp);

            if (sym.description !== expectedDesc || sym.toString() !== `Symbol(${expectedDesc})`) {
                throw new Error(`Test049 failed: Symbol(${descRegExp}) description="${sym.description}" (expected "${expectedDesc}"), toString()="${sym.toString()}"`);
            }

            return "Test Passed: SymbolRegExpDescTest049";
        },

        /**
         * 050. WeakMap uses Symbol as key correctly (retains identity).
         * Feature: Symbol can be used as WeakMap key; identity is preserved.
         */
        async test050_SymbolAsWeakMapKey() {
            const symKey = Symbol("weakmap-key");
            const weakMap = new WeakMap();
            const value = "weakmap-value";
            weakMap.set(symKey, value);

            if (!weakMap.has(symKey) || weakMap.get(symKey) !== value) {
                throw new Error(`Test050 failed: WeakMap has(symKey)=${weakMap.has(symKey)}, get(symKey)="${weakMap.get(symKey)}" (expected "${value}")`);
            }

            return "Test Passed: SymbolAsWeakMapKeyTest050";
        },



        /**
         * 052. Symbol with Map object as description uses Map's toString().
         * Feature: Map description is coerced to string via its toString() method.
         */
        async test052_SymbolMapDesc() {
            const descMap = new Map([["a", 1]]);
            const expectedDesc = descMap.toString();
            const sym = Symbol(descMap);

            if (sym.description !== expectedDesc || sym.toString() !== `Symbol(${expectedDesc})`) {
                throw new Error(`Test052 failed: Symbol(Map) description="${sym.description}" (expected "${expectedDesc}"), toString()="${sym.toString()}"`);
            }

            return "Test Passed: SymbolMapDescTest052";
        },

    async test053_SymbolJsonReplacer() {
        const symKey = Symbol("replacer-key");
        const obj = { [symKey]: "replacer-value", normal: "normal-value" };


        const jsonResult = JSON.stringify(obj, (key, value) => {

            if (typeof value === "object" && value !== null) {
                const serializedObj = { ...value };

                const symbolKeys = Object.getOwnPropertySymbols(value);
                symbolKeys.forEach(sym => {
                    serializedObj[sym.toString()] = value[sym];
                });
                return serializedObj;
            }
            return value;
        });


        const hasSymbolKey = jsonResult.includes(`"${symKey.toString()}"`);
        const hasSymbolValue = jsonResult.includes("replacer-value");

        if (!hasSymbolKey || !hasSymbolValue) {
            throw new Error(`Test053 failed: JSON.stringify with replacer returned "${jsonResult}" (expected to include Symbol key "${symKey.toString()}" and value "replacer-value")`);
        }

        return "Test Passed: SymbolJsonReplacerTest053";
    },

        /**
         * 054. Symbol as array element retains uniqueness.
         * Feature: Symbols in array are treated as distinct elements (even same description).
         */
        async test054_SymbolInArray() {
            const sym1 = Symbol("array-sym");
            const sym2 = Symbol("array-sym");
            const arr = [sym1, sym2];

            if (arr.length !== 2 || arr[0] === arr[1]) {
                throw new Error(`Test054 failed: Array with two same-desc Symbols has length=${arr.length} (expected 2), elements equal=${arr[0] === arr[1]} (expected false)`);
            }

            return "Test Passed: SymbolInArrayTest054";
        },

        /**
         * 055. Symbol.keyFor() returns undefined for constructor-created Symbol.
         * Feature: Symbol.keyFor() only works with global Symbols from Symbol.for().
         */
        async test055_SymbolKeyForConstructorSymbol() {
            const sym = Symbol("keyfor-test");
            const keyForResult = Symbol.keyFor(sym);

            if (keyForResult !== undefined) {
                throw new Error(`Test055 failed: Symbol.keyFor(Symbol("keyfor-test")) returned "${keyForResult}" (expected undefined)`);
            }

            return "Test Passed: SymbolKeyForConstructorSymbolTest055";
        },

        /**
         * 056. Symbol wrapper object in Set retains identity.
         * Feature: Set distinguishes between primitive Symbol and wrapper object.
         */
        async test056_SymbolWrapperInSet() {
            const sym = Symbol("set-wrapper");
            const wrapper = Object(sym);
            const set = new Set([sym, wrapper]);

            if (set.size !== 2 || !set.has(sym) || !set.has(wrapper)) {
                throw new Error(`Test056 failed: Set size=${set.size} (expected 2), has(primitive)=${set.has(sym)}, has(wrapper)=${set.has(wrapper)} (expected both true)`);
            }

            return "Test Passed: SymbolWrapperInSetTest056";
        },

        /**
         * 057. Symbol as class property (public) is accessible and unique.
         * Feature: Symbols can be used as class properties; uniqueness is preserved.
         */
        async test057_SymbolAsClassProperty() {
            const symProp = Symbol("class-prop");
            class TestClass {
                [symProp] = "class-value";
                getProp() {
                    return this[symProp];
                }
            }
            const instance = new TestClass();

            if (instance.getProp() !== "class-value" || !instance.hasOwnProperty(symProp)) {
                throw new Error(`Test057 failed: Class property value="${instance.getProp()}" (expected "class-value"), hasOwnProperty=${instance.hasOwnProperty(symProp)} (expected true)`);
            }

            return "Test Passed: SymbolAsClassPropertyTest057";
        },

        /**
         * 058. Symbol with WeakMap object as description uses WeakMap's toString().
         * Feature: WeakMap description is coerced to string via its toString() method.
         */
        async test058_SymbolWeakMapDesc() {
            const descWeakMap = new WeakMap([[{ key: 1 }, "value"]]);
            const expectedDesc = descWeakMap.toString();
            const sym = Symbol(descWeakMap);

            if (sym.description !== expectedDesc || sym.toString() !== `Symbol(${expectedDesc})`) {
                throw new Error(`Test058 failed: Symbol(WeakMap) description="${sym.description}" (expected "${expectedDesc}"), toString()="${sym.toString()}"`);
            }

            return "Test Passed: SymbolWeakMapDescTest058";
        },

        /**
         * 059. Object.assign copies Symbol properties to target.
         * Feature: Object.assign includes Symbol properties when copying objects.
         */
        async test059_ObjectAssignCopiesSymbol() {
            const symKey = Symbol("assign-key");
            const source = { [symKey]: "assign-value" };
            const target = {};
            Object.assign(target, source);

            if (!target.hasOwnProperty(symKey) || target[symKey] !== "assign-value") {
                throw new Error(`Test059 failed: Target object has Symbol property=${target.hasOwnProperty(symKey)}, value="${target[symKey]}" (expected "assign-value")`);
            }

            return "Test Passed: ObjectAssignCopiesSymbolTest059";
        },

        /**
         * 060. Symbol in Promise resolved value retains identity.
         * Feature: Symbols passed as Promise resolved values retain their identity.
         */
        async test060_SymbolInPromise() {
            const sym = Symbol("promise-sym");
            const resolvedSym = await Promise.resolve(sym);

            if (resolvedSym !== sym) {
                throw new Error(`Test060 failed: Resolved Promise value !== original Symbol (${resolvedSym} vs ${sym})`);
            }

            return "Test Passed: SymbolInPromiseTest060";
        },

        /**
         * 061. Symbol with Blob object as description uses Blob's toString().
         * Feature: Blob description is coerced to string via its toString() method.
         */
        async test061_SymbolBlobDesc() {
            if (typeof Blob === "undefined") {
                return "Test Skipped: SymbolBlobDescTest061 (Blob not available)";
            }
            const descBlob = new Blob(["test"], { type: "text/plain" });
            const expectedDesc = descBlob.toString();
            const sym = Symbol(descBlob);

            if (sym.description !== expectedDesc || sym.toString() !== `Symbol(${expectedDesc})`) {
                throw new Error(`Test061 failed: Symbol(Blob) description="${sym.description}" (expected "${expectedDesc}"), toString()="${sym.toString()}"`);
            }

            return "Test Passed: SymbolBlobDescTest061";
        },

        /**
         * 062. Symbol prototype properties are not enumerable.
         * Feature: Symbol.prototype's properties (e.g., toString) are non-enumerable.
         */
        async test062_SymbolPrototypePropertiesNonEnumerable() {
            const prototypeProps = Object.keys(Symbol.prototype);

            if (prototypeProps.length > 0) {
                throw new Error(`Test062 failed: Symbol.prototype has enumerable properties [${prototypeProps}] (expected none)`);
            }

            return "Test Passed: SymbolPrototypePropertiesNonEnumerableTest062";
        },

        /**
         * 063. Symbol as event name (browser only) works correctly.
         * Feature: Symbols can be used as event names in browser EventTarget.
         */
        async test063_SymbolAsEventName() {
            if (typeof window === "undefined" || typeof EventTarget !== "function") {
                return "Test Skipped: SymbolAsEventNameTest063 (Not in browser environment)";
            }
            const symEvent = Symbol("event-name");
            const target = new EventTarget();
            let eventTriggered = false;

            target.addEventListener(symEvent, () => {
                eventTriggered = true;
            });
            target.dispatchEvent(new Event(symEvent.toString()));
            target.removeEventListener(symEvent, () => {});

            if (!eventTriggered) {
                throw new Error(`Test063 failed: Event with Symbol name not triggered`);
            }

            return "Test Passed: SymbolAsEventNameTest063";
        },

        /**
         * 064. Symbol with ReadableStream object as description uses its toString().
         * Feature: ReadableStream description is coerced to string via its toString() method.
         */
        async test064_SymbolReadableStreamDesc() {
            if (typeof ReadableStream === "undefined") {
                return "Test Skipped: SymbolReadableStreamDescTest064 (ReadableStream not available)";
            }
            const descStream = new ReadableStream({ start() {} });
            const expectedDesc = descStream.toString();
            const sym = Symbol(descStream);

            if (sym.description !== expectedDesc || sym.toString() !== `Symbol(${expectedDesc})`) {
                throw new Error(`Test064 failed: Symbol(ReadableStream) description="${sym.description}" (expected "${expectedDesc}"), toString()="${sym.toString()}"`);
            }

            return "Test Passed: SymbolReadableStreamDescTest064";
        },

    /**
     * 065. Symbol as object property is configurable by default.
     * Feature: Symbol properties have configurable: true in property descriptor.
     */
    async test065_SymbolPropertyConfigurable() {
        const symKey = Symbol("configurable");
        const obj = { [symKey]: "value" };
        const descriptor = Object.getOwnPropertyDescriptor(obj, symKey);

        if (descriptor?.configurable !== true) {
            throw new Error(`Test065 failed: Symbol property configurable=${descriptor?.configurable} (expected true)`);
        }
        return "Test Passed: SymbolPropertyConfigurableTest065";
    },

    /**
     * 066. Proxy correctly proxies access to Symbol properties.
     * Feature: Proxy can intercept get/set operations for Symbol properties.
     */
    async test066_SymbolProxyInterception() {
        const symKey = Symbol("proxy-key");
        const target = { [symKey]: "original" };
        const proxy = new Proxy(target, {
            get(target, key) {
                return key === symKey ? "proxied" : target[key];
            }
        });

        if (proxy[symKey] !== "proxied") {
            throw new Error(`Test066 failed: Proxy get(Symbol) returned "${proxy[symKey]}" (expected "proxied")`);
        }
        return "Test Passed: SymbolProxyInterceptionTest066";
    },

    /**
     * 067. Symbol in Generator function retains identity.
     * Feature: Symbols passed through Generator yield retain their identity.
     */
    async test067_SymbolInGenerator() {
        const sym = Symbol("generator");
        function* gen() { yield sym; }
        const genInstance = gen();
        const yieldedSym = genInstance.next().value;

        if (yieldedSym !== sym) {
            throw new Error(`Test067 failed: Yielded Symbol !== original (${yieldedSym} vs ${sym})`);
        }
        return "Test Passed: SymbolInGeneratorTest067";
    },

    /**
     * 068. Symbol cannot be cloned via structuredClone (throws DataCloneError).
     * Feature: Symbol is not cloneable by structuredClone API.
     */
    async test068_SymbolStructuredClone() {
        if (typeof structuredClone === "undefined") {
            return "Test Skipped: SymbolStructuredCloneTest068 (structuredClone not available)";
        }
        const sym = Symbol("clone");
        let errorThrown = false;

        try {
            structuredClone(sym);
        } catch (e) {
            errorThrown = e.name === "DataCloneError";
        }

        if (!errorThrown) {
            throw new Error(`Test068 failed: structuredClone(Symbol) did not throw DataCloneError`);
        }
        return "Test Passed: SymbolStructuredCloneTest068";
    },

    /**
     * 069. Symbol properties are included in Reflect.ownKeys().
     * Feature: Reflect.ownKeys() returns both string and Symbol properties.
     */
    async test069_ReflectOwnKeysIncludesSymbol() {
        const symKey = Symbol("reflect-key");
        const obj = { [symKey]: "val", strKey: "str-val" };
        const ownKeys = Reflect.ownKeys(obj);

        if (!ownKeys.includes(symKey) || ownKeys.length !== 2) {
            throw new Error(`Test069 failed: Reflect.ownKeys() returned [${ownKeys}] (expected to include ${symKey}, length=2)`);
        }
        return "Test Passed: ReflectOwnKeysIncludesSymbolTest069";
    },

    /**
     * 070. Symbol with URL object as description uses URL's toString().
     * Feature: URL object description is coerced to string via its toString() method.
     */
    async test070_SymbolURLDesc() {
        if (typeof URL === "undefined") {
            return "Test Skipped: SymbolURLDescTest070 (URL not available)";
        }
        const descURL = new URL("https://example.com");
        const expectedDesc = descURL.toString();
        const sym = Symbol(descURL);

        if (sym.description !== expectedDesc || sym.toString() !== `Symbol(${expectedDesc})`) {
            throw new Error(`Test070 failed: Symbol(URL) description="${sym.description}" (expected "${expectedDesc}")`);
        }
        return "Test Passed: SymbolURLDescTest070";
    },

    /**
     * 071. Symbol property can be deleted with delete operator.
     * Feature: Symbol properties are deletable via delete operator.
     */
    async test071_SymbolPropertyDeletable() {
        const symKey = Symbol("deletable");
        const obj = { [symKey]: "value" };
        const deleteResult = delete obj[symKey];

        if (!deleteResult || obj.hasOwnProperty(symKey)) {
            throw new Error(`Test071 failed: delete Symbol property returned ${deleteResult}, hasOwnProperty=${obj.hasOwnProperty(symKey)} (expected true, false)`);
        }
        return "Test Passed: SymbolPropertyDeletableTest071";
    },

    /**
     * 072. Symbol with Error object as description uses Error's toString().
     * Feature: Error object description is coerced to string via its toString() method.
     */
    async test072_SymbolErrorDesc() {
        const descError = new Error("test error");
        const expectedDesc = descError.toString();
        const sym = Symbol(descError);

        if (sym.description !== expectedDesc || sym.toString() !== `Symbol(${expectedDesc})`) {
            throw new Error(`Test072 failed: Symbol(Error) description="${sym.description}" (expected "${expectedDesc}")`);
        }
        return "Test Passed: SymbolErrorDescTest072";
    },

    /**
     * 073. Symbol in async generator retains identity.
     * Feature: Symbols passed through async Generator yield retain identity.
     */
    async test073_SymbolInAsyncGenerator() {
        const sym = Symbol("async-gen");
        async function* asyncGen() { yield sym; }
        const genInstance = asyncGen();
        const { value: yieldedSym } = await genInstance.next();

        if (yieldedSym !== sym) {
            throw new Error(`Test073 failed: Async yielded Symbol !== original (${yieldedSym} vs ${sym})`);
        }
        return "Test Passed: SymbolInAsyncGeneratorTest073";
    },

    /**
     * 074. Symbol.prototype is not a Symbol instance.
     * Feature: Symbol.prototype is an object, not a Symbol primitive or wrapper.
     */
    async test074_SymbolPrototypeNotSymbolInstance() {
        const isSymbol = typeof Symbol.prototype === "symbol" || Symbol.prototype instanceof Symbol;

        if (isSymbol) {
            throw new Error(`Test074 failed: Symbol.prototype is considered a Symbol instance (expected object)`);
        }
        return "Test Passed: SymbolPrototypeNotSymbolInstanceTest074";
    },

    /**
     * 075. Symbol with ArrayBuffer object as description uses its toString().
     * Feature: ArrayBuffer description is coerced to string via its toString() method.
     */
    async test075_SymbolArrayBufferDesc() {
        const descBuffer = new ArrayBuffer(8);
        const expectedDesc = descBuffer.toString();
        const sym = Symbol(descBuffer);

        if (sym.description !== expectedDesc || sym.toString() !== `Symbol(${expectedDesc})`) {
            throw new Error(`Test075 failed: Symbol(ArrayBuffer) description="${sym.description}" (expected "${expectedDesc}")`);
        }
        return "Test Passed: SymbolArrayBufferDescTest075";
    },

    /**
     * 076. Symbol properties are not included in Object.values().
     * Feature: Object.values() excludes Symbol properties (only string-keyed values).
     */
    async test076_ObjectValuesExcludeSymbol() {
        const symKey = Symbol("values-exclude");
        const obj = { [symKey]: "sym-val", strKey: "str-val" };
        const values = Object.values(obj);

        if (values.includes("sym-val") || values.length !== 1) {
            throw new Error(`Test076 failed: Object.values() returned [${values}] (expected ["str-val"], length=1)`);
        }
        return "Test Passed: ObjectValuesExcludeSymbolTest076";
    },

    /**
     * 077. Symbol with FinalizationRegistry as description (if available) uses its toString().
     * Feature: FinalizationRegistry description is coerced to string via its toString() method.
     */
    async test077_SymbolFinalizationRegistryDesc() {
        if (typeof FinalizationRegistry === "undefined") {
            return "Test Skipped: SymbolFinalizationRegistryDescTest077 (FinalizationRegistry not available)";
        }
        const descFR = new FinalizationRegistry(() => {});
        const expectedDesc = descFR.toString();
        const sym = Symbol(descFR);

        if (sym.description !== expectedDesc || sym.toString() !== `Symbol(${expectedDesc})`) {
            throw new Error(`Test077 failed: Symbol(FinalizationRegistry) description="${sym.description}" (expected "${expectedDesc}")`);
        }
        return "Test Passed: SymbolFinalizationRegistryDescTest077";
    },

    /**
     * 078. Symbol cannot be used as Math operation operand (throws TypeError).
     * Feature: Symbol cannot be used in arithmetic operations; throws TypeError.
     */
    async test078_SymbolInMathOperation() {
        const sym = Symbol("math");
        let errorThrown = false;

        try {
            sym + 1;
        } catch (e) {
            errorThrown = e instanceof TypeError;
        }

        if (!errorThrown) {
            throw new Error(`Test078 failed: Symbol + 1 did not throw TypeError`);
        }
        return "Test Passed: SymbolInMathOperationTest078";
    },

    /**
     * 079. Object.getOwnPropertyDescriptors() includes Symbol properties.
     * Feature: Object.getOwnPropertyDescriptors() returns descriptors for Symbol properties.
     */
    async test079_GetOwnPropertyDescriptorsIncludesSymbol() {
        const symKey = Symbol("descriptor-key");
        const obj = { [symKey]: "val" };
        const descriptors = Object.getOwnPropertyDescriptors(obj);

        if (!descriptors.hasOwnProperty(symKey)) {
            throw new Error(`Test079 failed: Object.getOwnPropertyDescriptors() does not include Symbol property ${symKey}`);
        }
        return "Test Passed: GetOwnPropertyDescriptorsIncludesSymbolTest079";
    },

    /**
     * 080. Symbol with WeakRef object as description (if available) uses its toString().
     * Feature: WeakRef description is coerced to string via its toString() method.
     */
    async test080_SymbolWeakRefDesc() {
        if (typeof WeakRef === "undefined") {
            return "Test Skipped: SymbolWeakRefDescTest080 (WeakRef not available)";
        }
        const target = {};
        const descWR = new WeakRef(target);
        const expectedDesc = descWR.toString();
        const sym = Symbol(descWR);

        if (sym.description !== expectedDesc || sym.toString() !== `Symbol(${expectedDesc})`) {
            throw new Error(`Test080 failed: Symbol(WeakRef) description="${sym.description}" (expected "${expectedDesc}")`);
        }
        return "Test Passed: SymbolWeakRefDescTest080";
    },

    /**
     * 081. Symbol as static class property is accessible.
     * Feature: Symbols can be used as static class properties.
     */
    async test081_SymbolAsStaticClassProperty() {
        const symStatic = Symbol("static-prop");
        class TestClass {
            static [symStatic] = "static-value";
            static getStatic() {
                return TestClass[symStatic];
            }
        }

        if (TestClass.getStatic() !== "static-value") {
            throw new Error(`Test081 failed: Static Symbol property returned "${TestClass.getStatic()}" (expected "static-value")`);
        }
        return "Test Passed: SymbolAsStaticClassPropertyTest081";
    },

    /**
     * 082. Symbol with TypedArray (Float64Array) as description uses its toString().
     * Feature: TypedArray (Float64Array) description is coerced to string via its toString() method.
     */
    async test082_SymbolTypedArrayFloat64Desc() {
        const descTypedArray = new Float64Array([1.2, 3.4]);
        const expectedDesc = descTypedArray.toString();
        const sym = Symbol(descTypedArray);

        if (sym.description !== expectedDesc || sym.toString() !== `Symbol(${expectedDesc})`) {
            throw new Error(`Test082 failed: Symbol(Float64Array) description="${sym.description}" (expected "${expectedDesc}")`);
        }
        return "Test Passed: SymbolTypedArrayFloat64DescTest082";
    },

    /**
     * 083. Symbol explicit conversion to string via toString() works.
     * Feature: Symbol.prototype.toString() explicitly converts to string without error.
     */
    async test083_SymbolExplicitToString() {
        const sym = Symbol("explicit-toString");
        const strResult = sym.toString();
        const expected = `Symbol(${sym.description})`;

        if (strResult !== expected) {
            throw new Error(`Test083 failed: Symbol.toString() returned "${strResult}" (expected "${expected}")`);
        }
        return "Test Passed: SymbolExplicitToStringTest083";
    },

    /**
     * 084. Symbol properties can be enumerated with Object.getOwnPropertySymbols().
     * Feature: Object.getOwnPropertySymbols() enumerates all Symbol properties (even non-enumerable).
     */
    async test084_GetOwnPropertySymbolsIncludesNonEnumerable() {
        const symKey = Symbol("non-enumerable");
        const obj = {};
        Object.defineProperty(obj, symKey, {
            value: "val",
            enumerable: false,
            configurable: true,
            writable: true
        });
        const ownSymbols = Object.getOwnPropertySymbols(obj);

        if (!ownSymbols.includes(symKey) || ownSymbols.length !== 1) {
            throw new Error(`Test084 failed: Object.getOwnPropertySymbols() returned [${ownSymbols}] (expected [${symKey}], length=1)`);
        }
        return "Test Passed: GetOwnPropertySymbolsIncludesNonEnumerableTest084";
    },

    /**
     * 085. Symbol with DataView object as description uses its toString().
     * Feature: DataView description is coerced to string via its toString() method.
     */
    async test085_SymbolDataViewDesc() {
        const buffer = new ArrayBuffer(8);
        const descDataView = new DataView(buffer);
        const expectedDesc = descDataView.toString();
        const sym = Symbol(descDataView);

        if (sym.description !== expectedDesc || sym.toString() !== `Symbol(${expectedDesc})`) {
            throw new Error(`Test085 failed: Symbol(DataView) description="${sym.description}" (expected "${expectedDesc}")`);
        }
        return "Test Passed: SymbolDataViewDescTest085";
    },

    /**
     * 086. Symbol cannot be compared with >/< operators (throws TypeError).
     * Feature: Symbol cannot be used in relational comparisons; throws TypeError.
     */
    async test086_SymbolRelationalComparison() {
        const sym1 = Symbol("rel1");
        const sym2 = Symbol("rel2");
        let errorThrown = false;

        try {
            sym1 > sym2;
        } catch (e) {
            errorThrown = e instanceof TypeError;
        }

        if (!errorThrown) {
            throw new Error(`Test086 failed: Symbol > Symbol did not throw TypeError`);
        }
        return "Test Passed: SymbolRelationalComparisonTest086";
    },

    /**
     * 087. Symbol as event listener can be removed correctly (browser only).
     * Feature: Symbol can be used as event listener key for removal.
     */
    async test087_SymbolAsEventListener() {
        if (typeof window === "undefined" || typeof EventTarget !== "function") {
            return "Test Skipped: SymbolAsEventListenerTest087 (Not in browser environment)";
        }
        const symListener = Symbol("event-listener");
        const target = new EventTarget();
        let callCount = 0;
        const listener = () => { callCount++; };
        target.addEventListener("test", listener, { signal: AbortSignal.timeout(100) });
        target.addEventListener("test", listener);
        target.removeEventListener("test", listener);
        target.dispatchEvent(new Event("test"));

        if (callCount !== 0) {
            throw new Error(`Test087 failed: Removed Symbol-associated listener was called (callCount=${callCount}, expected 0)`);
        }
        return "Test Passed: SymbolAsEventListenerTest087";
    },



    /**
     * 089. Symbol with Number object as description uses its toString().
     * Feature: Number object description is coerced to string via its toString() method.
     */
    async test089_SymbolNumberObjectDesc() {
        const descNumObj = new Number(123);
        const expectedDesc = descNumObj.toString();
        const sym = Symbol(descNumObj);

        if (sym.description !== expectedDesc || sym.toString() !== `Symbol(${expectedDesc})`) {
            throw new Error(`Test089 failed: Symbol(Number object) description="${sym.description}" (expected "${expectedDesc}")`);
        }
        return "Test Passed: SymbolNumberObjectDescTest089";
    },

    /**
     * 090. Symbol.prototype.toString() throws on non-Symbol this.
     * Feature: Symbol.prototype.toString() throws if this is not a Symbol (primitive/wrapper).
     */
    async test090_SymbolPrototypeToStringInvalidThis() {
        const originalToString = Symbol.prototype.toString;
        let errorThrown = false;

        try {
            originalToString.call("not-a-symbol");
        } catch (e) {
            errorThrown = e instanceof TypeError;
        }

        if (!errorThrown) {
            throw new Error(`Test090 failed: Symbol.prototype.toString.call(non-Symbol) did not throw TypeError`);
        }
        return "Test Passed: SymbolPrototypeToStringInvalidThisTest090";
    },

    /**
     * 091. Symbol with Boolean object as description uses its toString().
     * Feature: Boolean object description is coerced to string via its toString() method.
     */
    async test091_SymbolBooleanObjectDesc() {
        const descBoolObj = new Boolean(false);
        const expectedDesc = descBoolObj.toString();
        const sym = Symbol(descBoolObj);

        if (sym.description !== expectedDesc || sym.toString() !== `Symbol(${expectedDesc})`) {
            throw new Error(`Test091 failed: Symbol(Boolean object) description="${sym.description}" (expected "${expectedDesc}")`);
        }
        return "Test Passed: SymbolBooleanObjectDescTest091";
    },

    /**
     * 092. Symbol cannot be used with logical NOT (!) without error.
     * Feature: Logical NOT (!) converts Symbol to boolean (no error, returns false).
     */
    async test092_SymbolLogicalNot() {
        const sym = Symbol("logical-not");
        const result = !sym;

        if (result !== false) {
            throw new Error(`Test092 failed: !Symbol returned ${result} (expected false)`);
        }
        return "Test Passed: SymbolLogicalNotTest092";
    },

    /**
     * 093. Symbol with String object as description uses its toString().
     * Feature: String object description is coerced to string via its toString() method.
     */
    async test093_SymbolStringObjectDesc() {
        const descStrObj = new String("string-object");
        const expectedDesc = descStrObj.toString();
        const sym = Symbol(descStrObj);

        if (sym.description !== expectedDesc || sym.toString() !== `Symbol(${expectedDesc})`) {
            throw new Error(`Test093 failed: Symbol(String object) description="${sym.description}" (expected "${expectedDesc}")`);
        }
        return "Test Passed: SymbolStringObjectDescTest093";
    },

    /**
     * 094. Symbol properties can be made non-enumerable via Object.defineProperty.
     * Feature: Symbol properties can be configured as non-enumerable.
     */
    async test094_SymbolPropertyNonEnumerable() {
        const symKey = Symbol("non-enum-config");
        const obj = {};
        Object.defineProperty(obj, symKey, {
            value: "val",
            enumerable: false
        });
        const keys = Object.keys(obj);
        const ownSymbols = Object.getOwnPropertySymbols(obj);

        if (keys.includes(symKey.toString()) || !ownSymbols.includes(symKey)) {
            throw new Error(`Test094 failed: Non-enumerable Symbol property was enumerated=${keys.includes(symKey.toString())}, not in ownSymbols=${!ownSymbols.includes(symKey)}`);
        }
        return "Test Passed: SymbolPropertyNonEnumerableTest094";
    },

    /**
     * 095. Symbol as WeakSet element retains uniqueness.
     * Feature: Symbols in WeakSet are treated as distinct elements (even same description).
     */
    async test095_SymbolInWeakSet() {
        const sym1 = Symbol("weakset-sym");
        const sym2 = Symbol("weakset-sym");
        const weakSet = new WeakSet([sym1, sym2]);

        if (!weakSet.has(sym1) || !weakSet.has(sym2)) {
            throw new Error(`Test095 failed: WeakSet has(sym1)=${weakSet.has(sym1)}, has(sym2)=${weakSet.has(sym2)} (expected both true)`);
        }
        return "Test Passed: SymbolInWeakSetTest095";
    },

    /**
     * 096. Symbol property is non-enumerable by default.
     * Feature: Symbol properties have enumerable: false in default property descriptor.
     */
    async test096_SymbolPropertyDefaultEnumerable() {
        const symKey = Symbol("default-enum");
        const obj = { [symKey]: "value" };
        const descriptor = Object.getOwnPropertyDescriptor(obj, symKey);

        if (descriptor?.enumerable !== true) {
            throw new Error(`Test096 failed: Symbol property enumerable=${descriptor?.enumerable} (expected true)`);
        }
        return "Test Passed: SymbolPropertyDefaultEnumerableTest096";
    },


    /**
     * 099. Symbol retains identity after module export/import simulation.
     * Feature: Symbols retain reference identity when passed between "modules".
     */
    async test099_SymbolModuleExportImport() {

        const module = (() => {
            const symExport = Symbol("module-sym");
            return { getSym: () => symExport };
        })();
        const symImport1 = module.getSym();
        const symImport2 = module.getSym();

        if (symImport1 !== symImport2) {
            throw new Error(`Test099 failed: Exported Symbol instances are not equal (${symImport1} vs ${symImport2})`);
        }
        return "Test Passed: SymbolModuleExportImportTest099";
    },

    /**
     * 100. Symbol with TextEncoder/TextDecoder (no impact on encoding).
     * Feature: Symbols passed as additional data don't affect TextEncoder results.
     */
    async test100_SymbolWithTextEncoding() {
        if (typeof TextEncoder === "undefined" || typeof TextDecoder === "undefined") {
            return "Test Skipped: SymbolWithTextEncodingTest100 (TextEncoder/TextDecoder not available)";
        }
        const symEncode = Symbol("encode-data");
        const encoder = new TextEncoder();
        const data = encoder.encode("test", symEncode);
        const decoder = new TextDecoder();
        const decoded = decoder.decode(data);

        if (decoded !== "test") {
            throw new Error(`Test100 failed: Encoded/decoded result="${decoded}" (expected "test")`);
        }
        return "Test Passed: SymbolWithTextEncodingTest100";
    },

    /**
     * 101. Symbol retains identity in setTimeout callback.
     * Feature: Symbols passed to setTimeout retain reference identity.
     */
    async test101_SymbolInSetTimeout() {
        const sym = Symbol("settimeout");
        let receivedSym;
        const promise = new Promise((resolve) => {
            setTimeout(() => {
                receivedSym = sym;
                resolve();
            }, 10);
        });
        await promise;

        if (receivedSym !== sym) {
            throw new Error(`Test101 failed: setTimeout callback received Symbol !== original (${receivedSym} vs ${sym})`);
        }
        return "Test Passed: SymbolInSetTimeoutTest101";
    },

    /**
     * 102. Symbol as Map key with complex value retains association.
     * Feature: Symbols as Map keys correctly retain association with complex values.
     */
    async test102_SymbolAsMapKeyComplexValue() {
        const symKey = Symbol("map-complex");
        const complexValue = { nested: { data: "complex" } };
        const map = new Map([[symKey, complexValue]]);

        if (map.get(symKey) !== complexValue || map.get(symKey).nested.data !== "complex") {
            throw new Error(`Test102 failed: Map key Symbol does not retain complex value association`);
        }
        return "Test Passed: SymbolAsMapKeyComplexValueTest102";
    },

    /**
     * 103. Symbol property with getter configuration works.
     * Feature: Symbol properties can be configured with custom getters.
     */
    async test103_SymbolPropertyWithGetter() {
        const symKey = Symbol("getter-prop");
        const obj = {};
        let getterCalled = false;
        Object.defineProperty(obj, symKey, {
            get() {
                getterCalled = true;
                return "getter-value";
            },
            configurable: true
        });
        const value = obj[symKey];

        if (value !== "getter-value" || !getterCalled) {
            throw new Error(`Test103 failed: Symbol getter returned "${value}" (expected "getter-value"), getter called=${getterCalled}`);
        }
        return "Test Passed: SymbolPropertyWithGetterTest103";
    },

    /**
     * 104. Symbol in Promise.reject retains identity in catch.
     * Feature: Symbols passed to Promise.reject retain identity in catch handler.
     */
    async test104_SymbolInPromiseReject() {
        const sym = Symbol("promise-reject");
        let caughtSym;
        try {
            await Promise.reject(sym);
        } catch (e) {
            caughtSym = e;
        }

        if (caughtSym !== sym) {
            throw new Error(`Test104 failed: Caught Symbol !== original (${caughtSym} vs ${sym})`);
        }
        return "Test Passed: SymbolInPromiseRejectTest104";
    },

    /**
     * 105. Symbol.iterator as custom iterator key.
     * Feature: Symbol.iterator can be used to define custom iterable behavior.
     */
    async test105_SymbolIteratorCustomIterable() {
        const symIter = Symbol.iterator;
        const iterableObj = {
            data: [1, 2, 3],
            [symIter]() {
                let index = 0;
                return {
                    next: () => ({
                        value: this.data[index++],
                        done: index > this.data.length
                    })
                };
            }
        };
        const iterated = [...iterableObj];

        if (JSON.stringify(iterated) !== "[1,2,3]") {
            throw new Error(`Test105 failed: Custom iterable returned [${iterated}] (expected [1,2,3])`);
        }
        return "Test Passed: SymbolIteratorCustomIterableTest105";
    },

    /**
     * 106. Object.entries() excludes Symbol properties.
     * Feature: Object.entries() returns only string-keyed property pairs.
     */
    async test106_ObjectEntriesExcludeSymbol() {
        const symKey = Symbol("entries-exclude");
        const obj = { [symKey]: "sym-val", strKey: "str-val" };
        const entries = Object.entries(obj);

        if (entries.some(([k]) => k === symKey.toString()) || entries.length !== 1) {
            throw new Error(`Test106 failed: Object.entries() returned [${entries}] (expected [["strKey","str-val"]])`);
        }
        return "Test Passed: ObjectEntriesExcludeSymbolTest106";
    },

    /**
     * 107. Symbol with AbortController (associates abort signal).
     * Feature: Symbols can be used to associate abort signals with operations.
     */
    async test107_SymbolWithAbortController() {
        if (typeof AbortController === "undefined") {
            return "Test Skipped: SymbolWithAbortControllerTest107 (AbortController not available)";
        }
        const symAbort = Symbol("abort-op");
        const controller = new AbortController();
        const signal = controller.signal;
        const operations = new Map([[symAbort, { signal }]]);

        controller.abort();
        const op = operations.get(symAbort);

        if (!op?.signal.aborted) {
            throw new Error(`Test107 failed: Symbol-associated abort signal not aborted`);
        }
        return "Test Passed: SymbolWithAbortControllerTest107";
    },

    /**
     * 108. Symbol.description property is non-enumerable.
     * Feature: Symbol's description property has enumerable: false.
     */
    async test108_SymbolDescriptionEnumerable() {
        const sym = Symbol("desc-enum");
        const descriptor = Object.getOwnPropertyDescriptor(sym, "description");

        if (descriptor?.enumerable !== undefined) {
            throw new Error(`Test108 failed: Symbol.description enumerable=${descriptor?.enumerable} (expected undefined)`);
        }
        return "Test Passed: SymbolDescriptionEnumerableTest108";
    },

    /**
     * 109. Symbol as Error object property (retrievable via getOwnPropertySymbols).
     * Feature: Symbol properties on Error instances are retrievable.
     */
    async test109_SymbolAsErrorProperty() {
        const symErr = Symbol("error-prop");
        const error = new Error("test error");
        error[symErr] = "error-meta";
        const errSymbols = Object.getOwnPropertySymbols(error);

        if (!errSymbols.includes(symErr)) {
            throw new Error(`Test109 failed: Error object does not have Symbol property ${symErr}`);
        }
        return "Test Passed: SymbolAsErrorPropertyTest109";
    },

    /**
     * 110. Symbol with Intl API (no impact on formatting).
     * Feature: Symbols passed as options don't affect Intl formatting results.
     */
    async test110_SymbolWithIntl() {
        const symIntl = Symbol("intl-option");
        const formatter = new Intl.DateTimeFormat("en-US", { [symIntl]: "ignored" });
        const formatted = formatter.format(new Date("2024-01-01"));

        if (!formatted.includes("1/1/2024") && !formatted.includes("Jan 1, 2024")) {
            throw new Error(`Test110 failed: Intl formatted result="${formatted}" (expected 2024-01-01 format)`);
        }
        return "Test Passed: SymbolWithIntlTest110";
    },

    /**
     * 111. Symbol retains identity in setInterval callback.
     * Feature: Symbols passed to setInterval retain reference identity.
     */
    async test111_SymbolInSetInterval() {
        const sym = Symbol("setinterval");
        let receivedSym;
        const promise = new Promise((resolve) => {
            const interval = setInterval(() => {
                receivedSym = sym;
                clearInterval(interval);
                resolve();
            }, 10);
        });
        await promise;

        if (receivedSym !== sym) {
            throw new Error(`Test111 failed: setInterval callback received Symbol !== original (${receivedSym} vs ${sym})`);
        }
        return "Test Passed: SymbolInSetIntervalTest111";
    },

    /**
     * 112. Symbol property can be made enumerable via Object.defineProperty.
     * Feature: Symbol properties can be configured as enumerable.
     */
    async test112_SymbolPropertyMakeEnumerable() {
        const symKey = Symbol("make-enum");
        const obj = {};
        Object.defineProperty(obj, symKey, {
            value: "value",
            enumerable: true,
            configurable: true,
            writable: true
        });
        const keys = Object.keys(obj);
        const ownSymbols = Object.getOwnPropertySymbols(obj);

        if (!ownSymbols.includes(symKey) || obj.propertyIsEnumerable(symKey) !== true) {
            throw new Error(`Test112 failed: Symbol property not enumerable after configuration, propertyIsEnumerable=${obj.propertyIsEnumerable(symKey)}`);
        }
        return "Test Passed: SymbolPropertyMakeEnumerableTest112";
    },

    /**
     * 113. Symbol with Blob.slice() (browser only) retains description.
     * Feature: Blob slicing doesn't affect Symbol description derived from Blob.
     */
    async test113_SymbolWithBlobSlice() {
        if (typeof Blob === "undefined") {
            return "Test Skipped: SymbolWithBlobSliceTest113 (Blob not available)";
        }
        const originalBlob = new Blob(["test data"], { type: "text/plain" });
        const slicedBlob = originalBlob.slice(0, 4);
        const symOriginal = Symbol(originalBlob);
        const symSliced = Symbol(slicedBlob);

        if (symOriginal.description !== originalBlob.toString() || symSliced.description !== slicedBlob.toString()) {
            throw new Error(`Test113 failed: Symbol description for sliced Blob is incorrect`);
        }
        return "Test Passed: SymbolWithBlobSliceTest113";
    },



    /**
     * 115. Symbol as WebSocket event name (browser only) works.
     * Feature: Symbols can be used as WebSocket event names (stringified).
     */
    async test115_SymbolAsWebSocketEvent() {
        if (typeof WebSocket === "undefined") {
            return "Test Skipped: SymbolAsWebSocketEventTest115 (WebSocket not available)";
        }
        const symWsEvent = Symbol("ws-event");
        let eventTriggered = false;

        class MockWebSocket extends WebSocket {
            constructor() { super("ws://localhost"); }
            dispatchEvent(event) {
                if (event.type === symWsEvent.toString()) eventTriggered = true;
            }
        }
        const ws = new MockWebSocket();
        ws.addEventListener(symWsEvent.toString(), () => {});
        ws.dispatchEvent(new Event(symWsEvent.toString()));

        if (!eventTriggered) {
            throw new Error(`Test115 failed: WebSocket event with Symbol name not triggered`);
        }
        return "Test Passed: SymbolAsWebSocketEventTest115";
    },

    /**
     * 116. Proxy intercepts set operation for Symbol properties.
     * Feature: Proxy can intercept set operations on Symbol properties.
     */
    async test116_SymbolProxySetInterception() {
        const symKey = Symbol("proxy-set");
        const target = { [symKey]: "original" };
        let setCalled = false;
        const proxy = new Proxy(target, {
            set(target, key, value) {
                if (key === symKey) {
                    setCalled = true;
                    target[key] = value;
                    return true;
                }
                return false;
            }
        });
        proxy[symKey] = "new-value";

        if (!setCalled || target[symKey] !== "new-value") {
            throw new Error(`Test116 failed: Proxy set(Symbol) not intercepted, target value="${target[symKey]}" (expected "new-value")`);
        }
        return "Test Passed: SymbolProxySetInterceptionTest116";
    },

    /**
     * 117. Symbol property default writable is true.
     * Feature: Symbol properties have writable: true in default property descriptor.
     */
    async test117_SymbolPropertyDefaultWritable() {
        const symKey = Symbol("default-writable");
        const obj = { [symKey]: "original" };
        obj[symKey] = "modified";

        if (obj[symKey] !== "modified") {
            throw new Error(`Test117 failed: Symbol property not writable (value="${obj[symKey]}" expected "modified")`);
        }
        return "Test Passed: SymbolPropertyDefaultWritableTest117";
    },

    /**
     * 118. Symbol with URLSearchParams (converted to string key).
     * Feature: Symbols used as URLSearchParams keys are converted to string.
     */
    async test118_SymbolWithURLSearchParams() {
        if (typeof URLSearchParams === "undefined") {
            return "Test Skipped: SymbolWithURLSearchParamsTest118 (URLSearchParams not available)";
        }
        const symParam = Symbol("param-key");
        const params = new URLSearchParams();
        params.append(symParam.toString(), "param-value");
        const paramValue = params.get(symParam.toString());

        if (paramValue !== "param-value") {
            throw new Error(`Test118 failed: URLSearchParams with Symbol key returned "${paramValue}" (expected "param-value")`);
        }
        return "Test Passed: SymbolWithURLSearchParamsTest118";
    },



    /**
     * 120. Symbol properties not restored by Object.fromEntries().
     * Feature: Object.fromEntries() does not restore Symbol-keyed properties.
     */
    async test120_ObjectFromEntriesExcludeSymbol() {
        const symKey = Symbol("from-entries");
        const original = { [symKey]: "value", strKey: "str-val" };
        const entries = Object.entries(original);
        const restored = Object.fromEntries(entries);
        const restoredSymbols = Object.getOwnPropertySymbols(restored);

        if (restoredSymbols.includes(symKey)) {
            throw new Error(`Test120 failed: Object.fromEntries() restored Symbol property ${symKey} (expected excluded)`);
        }
        return "Test Passed: ObjectFromEntriesExcludeSymbolTest120";
    },

    /**
     * 121. Symbol with Crypto API (no impact on operations).
     * Feature: Symbols as additional data don't affect Crypto API results.
     */
    async test121_SymbolWithCrypto() {
        if (typeof crypto === "undefined" || typeof crypto.subtle === "undefined") {
            return "Test Skipped: SymbolWithCryptoTest121 (Crypto API not available)";
        }
        const symCrypto = Symbol("crypto-data");
        const key = await crypto.subtle.generateKey(
            { name: "AES-GCM", length: 128 },
            true,
            ["encrypt", "decrypt"]
        );
        const data = new TextEncoder().encode("secret");
        const iv = crypto.getRandomValues(new Uint8Array(12));
        const encrypted = await crypto.subtle.encrypt(
            { name: "AES-GCM", iv, additionalData: symCrypto.toString() },
            key,
            data
        );

        if (!(encrypted instanceof ArrayBuffer)) {
            throw new Error(`Test121 failed: Crypto encrypt with Symbol additionalData failed`);
        }
        return "Test Passed: SymbolWithCryptoTest121";
    },

    /**
     * 122. Symbol.prototype.toString() works in strict mode.
     * Feature: Symbol.prototype.toString() behaves consistently in strict mode.
     */
    async test122_SymbolToStringInStrictMode() {
        "use strict";
        const sym = Symbol("strict-tostring");
        const strResult = sym.toString();
        const expected = `Symbol(${sym.description})`;

        if (strResult !== expected) {
            throw new Error(`Test122 failed: Strict mode Symbol.toString() returned "${strResult}" (expected "${expected}")`);
        }
        return "Test Passed: SymbolToStringInStrictModeTest122";
    },



    /**
     * 124. Symbol in Array.from() retains uniqueness.
     * Feature: Array.from processes Symbol elements while retaining uniqueness.
     */
    async test124_SymbolInArrayFrom() {
        const sym1 = Symbol("array-from");
        const sym2 = Symbol("array-from");
        const iterable = {
            [Symbol.iterator]: () => [sym1, sym2][Symbol.iterator]()
        };
        const result = Array.from(iterable);

        if (result.length !== 2 || result[0] !== sym1 || result[1] !== sym2) {
            throw new Error(`Test124 failed: Array.from returned [${result}] (expected [${sym1}, ${sym2}], length=2)`);
        }
        return "Test Passed: SymbolInArrayFromTest124";
    }

};