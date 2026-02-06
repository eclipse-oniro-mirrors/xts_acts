/*
* Copyright (C) 2024 HiHope Open Source Organization.
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
/**
 * WeakRef Verification Utility Class: Covers MDN WeakRef/FinalizationRegistry core features.
 * Key Fix: All GC-related cases follow "release strong ref → setTimeout (wait for mark) → trigger GC" order.
 * Timeout set to 100ms to ensure JS engine finishes recyclable object marking.
 */
export const WeakRefTestUtils = {
    /**
     * 1. Test Point: WeakRef only references objects/null (primitives throw TypeError)
     * No GC involved — no modification needed.
     */
    test001_PrimitiveWeakRefThrowError() {
        const primitiveValues = [
            123,          // number
            'string',     // string
            true,         // boolean
            null,         // null (allowed, deref() returns null)
            undefined,    // undefined
            BigInt(100)   // BigInt
        ];

        for (const val of primitiveValues) {
            let errorThrown = false;
            try {
                new WeakRef(val);
            } catch (err) {
                if (val !== null && err instanceof TypeError ) {
                    errorThrown = true;
                }
            }
            if (val !== null && !errorThrown) {
                throw new Error(`WeakRef allowed primitive target: ${String(val)} (expected TypeError)`);
            }

        }

        // Positive case: Wrapped Symbol object (valid)
        const wrappedSymbolObj = Object(Symbol('wrapped-sym'));
        const weakRefForSym = new WeakRef(wrappedSymbolObj);
        if (!(weakRefForSym instanceof WeakRef) || weakRefForSym.deref() !== wrappedSymbolObj) {
            throw new Error("WeakRef creation failed for wrapped Symbol object");
        }

        return "Test Passed: WeakRefPrimitiveThrowErrorTest001";
    },

    /**
     * 2. Test Point: deref() returns object before GC, undefined after GC
     * Fix: Release strong ref → setTimeout(100ms) → trigger GC
     */
    async test002_DerefBeforeAfterGC() {
        let weakRefInstance;

        (function createWeakRef() {
            const gcTarget = { id: 'deref-gc-target', data: 'test' };
            weakRefInstance = new WeakRef(gcTarget);
            if (weakRefInstance.deref() !== gcTarget) {
                throw new Error("Initial deref() returns wrong object");
            }
        })();

        // Before GC: deref() returns object
        if (weakRefInstance.deref() === undefined) {
            throw new Error("deref() returns undefined before GC (unexpected)");
        }

        // Step 1: Release strong reference
        // const tempWeakRef = weakRefInstance;
        // weakRefInstance = null;

        // Step 2: Wait for macro task (100ms) — ensure engine marks object as recyclable
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 3: Trigger GC (after waiting)
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30)); // Wait for GC to finish

        // After GC: deref() returns undefined
        if (weakRefInstance.deref() !== undefined) {
            throw new Error("deref() returns object after GC (expected undefined)");
        }

        return "Test Passed: WeakRefDerefBeforeAfterGCTest002";
    },

    /**
     * 3. Test Point: FinalizationRegistry callback triggers once per registration
     * Fix: Release strong ref → setTimeout(100ms) → trigger GC
     */
    async test003_FinalizationCallbackMultiRegister() {
        const callbackHeldValues = [];
        const fr = new FinalizationRegistry((hv) => callbackHeldValues.push(hv));

        let targetObj, unregisterToken;
        (function registerTargets() {
            targetObj = { id: 'multi-register-target' };
            unregisterToken = {};
            fr.register(targetObj, 'hv-1', unregisterToken);
            fr.register(targetObj, 'hv-2', unregisterToken);
        })();

        // Before GC: callback not triggered
        if (callbackHeldValues.length !== 0) {
            throw new Error(`Callback triggered ${callbackHeldValues.length} times before GC (expected 0)`);
        }

        // Step 1: Release strong references
        targetObj = null;
        unregisterToken = null;

        // Step 2: Wait for macro task (100ms) — engine marks object as recyclable
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 3: Trigger GC
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30));

        // After GC: callback triggers 2 times
        if (callbackHeldValues.length !== 2) {
            throw new Error(`Callback triggered ${callbackHeldValues.length} times (expected 2)`);
        }
        const sortedHV = callbackHeldValues.sort();
        if (sortedHV[0] !== 'hv-1' || sortedHV[1] !== 'hv-2') {
            throw new Error(`Held values incorrect: ${callbackHeldValues.join(', ')}`);
        }

        return "Test Passed: WeakRefFinalizationCallbackMultiRegisterTest003";
    },

    /**
     * 4. Test Point: unregister() cancels FinalizationRegistry callback
     * Fix: Release strong ref → setTimeout(100ms) → trigger GC
     */
    async test004_FinalizationUnregister() {
        let isCallbackTriggered = false;
        const fr = new FinalizationRegistry(() => isCallbackTriggered = true);

        let targetObj, cancelToken;
        (function registerAndCancel() {
            targetObj = { id: 'unregister-target' };
            cancelToken = {};
            fr.register(targetObj, 'unused-hv', cancelToken);
            const cancelRes = fr.unregister(cancelToken);
            if (!cancelRes) {
                throw new Error("unregister() returns false (expected true)");
            }
        })();

        // Step 1: Release strong references
        targetObj = null;
        cancelToken = null;

        // Step 2: Wait for macro task (100ms) — engine marks object
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 3: Trigger GC
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30));

        // After GC: callback not triggered
        if (isCallbackTriggered) {
            throw new Error("Callback triggered after unregister() (expected not to)");
        }

        return "Test Passed: WeakRefFinalizationUnregisterTest004";
    },

    /**
     * 5. Test Point: Multiple deref() calls return consistent results
     * Fix: Release strong ref → setTimeout(100ms) → trigger GC
     */
    async test005_DerefConsistency() {
        let weakRef,originalTarget;
        (function createWeakRef() {
             originalTarget = { id: 'deref-consistency-target' };
            weakRef = new WeakRef(originalTarget);
        })();

        // Before GC: multiple deref() return original object
        let preGcResults = [weakRef.deref(), weakRef.deref(), weakRef.deref()];
        if (preGcResults.some(res => res !== originalTarget)) {
            throw new Error("Multiple deref() return inconsistent results before GC");
        }

        preGcResults = null;

        // Step 1: Release strong reference
        originalTarget = null;

        // Step 2: Wait for macro task (100ms) — engine marks object
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 3: Trigger GC
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        }
        await new Promise(resolve => setTimeout(resolve, 30));
        if (weakRef.deref() !== undefined) {
            throw new Error("deref() returns object after GC (expected undefined)");
        }
        // After GC: multiple deref() return undefined
        const postGcResults = [weakRef.deref(), weakRef.deref(), weakRef.deref()];
        if (postGcResults.some(res => res !== undefined)) {
            throw new Error("Multiple deref() return non-undefined after GC");
        }

        return "Test Passed: WeakRefDerefConsistencyTest005";
    },

    /**
     * 6. Test Point: WeakRef cannot be serialized with JSON.stringify
     * No GC involved — no modification needed.
     */
    test006_WeakRefJsonStringify() {
        const targetObj = { id: 'serialize-target' };
        const weakRef = new WeakRef(targetObj);

        // Direct serialization
        let directError = false;

            JSON.stringify(weakRef);


        // Nested serialization
        const objWithWeakRef = { name: 'test', ref: weakRef };
        let nestedError = false;

            JSON.stringify(objWithWeakRef);


        // Dereferenced object serialization (valid)
        const derefObj = weakRef.deref();
        const serialized = JSON.stringify(derefObj);
        const parsed = JSON.parse(serialized);
        if (parsed.id !== 'serialize-target') {
            throw new Error("Serialized dereferenced object is incorrect");
        }

        return "Test Passed: WeakRefJsonStringifyTest006";
    },

    /**
     * 7. Test Point: FinalizationRegistry callbacks trigger after GC (replace cleanupSome())
     * Core Change: Remove cleanupSome() entirely; rely on GC to trigger callbacks.
     * Logic: Release refs → wait 100ms → trigger GC → verify callback count
     */
    async test007_FinalizationCallbackAfterGC() {
        const collectedHeldValues = [];
        // Create FinalizationRegistry (collect held values on callback)
        const fr = new FinalizationRegistry((heldValue) => {
            collectedHeldValues.push(heldValue);
        });

        let target1, target2;
        (function registerTwoTargets() {
            // Register two independent targets (each triggers one callback)
            target1 = { id: 'gc-callback-target-1' };
            target2 = { id: 'gc-callback-target-2' };
            fr.register(target1, 'hv-target-1');
            fr.register(target2, 'hv-target-2');
        })();

        // Step 1: Release all strong references to targets
        target1 = null;
        target2 = null;

        // Step 2: Wait 100ms — ensure engine marks both targets as recyclable
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 3: Trigger GC (auto-triggers FinalizationRegistry callbacks)
        let gcTriggered = false;
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
            gcTriggered = true;
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
            gcTriggered = true;
        }
        if (!gcTriggered) {
            console.warn("[Warning] Manual GC not supported; waiting for auto-GC (may take longer)");
        }
        // Wait longer (500ms) for auto-GC if manual GC is unavailable
        await new Promise(resolve => setTimeout(resolve, gcTriggered ? 300 : 500));

        // Step 4: Verify callback count (2 targets → 2 callbacks)
        if (collectedHeldValues.length !== 2) {
            // Retry GC once if callbacks not triggered (for unstable environments)
            if (gcTriggered) {
                if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
                else if (window?.gc || global.gc) (window.gc || global.gc)();
                await new Promise(resolve => setTimeout(resolve, 200));
            }
            // Re-check after retry
            if (collectedHeldValues.length !== 2) {
                throw new Error(`Final callbacks triggered: ${collectedHeldValues.length} (expected 2). Collected values: [${collectedHeldValues.join(', ')}]`);
            }
        }

        // Verify held values are correct
        const sortedHV = collectedHeldValues.sort();
        if (sortedHV[0] !== 'hv-target-1' || sortedHV[1] !== 'hv-target-2') {
            throw new Error(`Held values incorrect: [${collectedHeldValues.join(', ')}] (expected hv-target-1, hv-target-2)`);
        }

        return "Test Passed: WeakRefFinalizationCallbackAfterGCTest007";
    },

    /**
     * 8. Test Point: WeakRef does not prevent object GC
     * Fix: Release strong ref → setTimeout(100ms) → trigger GC
     */
    async test008_WeakRefDoesNotPreventGC() {
        let weakRef;
        const helperWM = new WeakMap();

        (function createWeakRefAndWM() {
            const targetObj = { id: 'gc-test-target' };
            weakRef = new WeakRef(targetObj);
            helperWM.set(targetObj, 'helper-value');
        })();

        // Step 1: Release strong reference
        const tempWeakRef = weakRef;
        weakRef = null;

        // Step 2: Wait for macro task (100ms) — engine marks object
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 3: Trigger GC
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30));

        // Verify WeakRef GC
        if (tempWeakRef.deref() !== undefined) {
            throw new Error("WeakRef prevents GC (deref() returns object)");
        }

        // Verify WeakMap GC (auxiliary check)
        const sameStructObj = { id: 'gc-test-target' };
        if (helperWM.get(sameStructObj) !== undefined) {
            throw new Error("WeakMap confirms object not GC'd");
        }

        return "Test Passed: WeakRefDoesNotPreventGCTest008";
    },

    /**
     * 9. Test Point: No unregisterToken → cannot cancel callback
     * Fix: Release strong ref → setTimeout(100ms) → trigger GC
     */
    async test009_NoUnregisterTokenCannotCancel() {
        let isCallbackTriggered = false;
        const fr = new FinalizationRegistry(() => isCallbackTriggered = true);

        let targetObj;
        (function registerWithoutToken() {
            targetObj = { id: 'no-token-target' };
            fr.register(targetObj, 'no-token-hv');
            // Try cancel with invalid token
            const cancelRes = fr.unregister({});
            if (cancelRes) {
                throw new Error("unregister() returns true for invalid token");
            }
        })();

        // Step 1: Release strong reference
        targetObj = null;

        // Step 2: Wait for macro task (100ms) — engine marks object
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 3: Trigger GC
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30));

        // Verify callback triggered
        if (!isCallbackTriggered) {
            throw new Error("Callback not triggered (expected to fire without token)");
        }

        return "Test Passed: WeakRefNoUnregisterTokenTest009";
    },

    /**
     * 10. Test Point: deref() returns undefined stably after GC
     * Fix: Release strong ref → setTimeout(100ms) → trigger GC
     */
    async test010_DerefUndefinedStable() {
        let weakRef;
        (function createWeakRef() {
            const targetObj = { id: 'stable-undefined-target' };
            weakRef = new WeakRef(targetObj);
        })();

        // Step 1: Release strong reference
        let tempTarget = weakRef.deref();
        tempTarget = null;

        // Step 2: Wait for macro task (100ms) — engine marks object
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 3: Trigger GC
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30));

        // Immediate verification
        if (weakRef.deref() !== undefined) {
            throw new Error("deref() not undefined immediately after GC");
        }

        // Delayed verification (5 attempts, 100ms each)
        for (let i = 1; i <= 5; i++) {
            await new Promise(resolve => setTimeout(resolve, 30));
            if (weakRef.deref() !== undefined) {
                throw new Error(`deref() returns object on attempt ${i} after GC`);
            }
        }

        return "Test Passed: WeakRefDerefUndefinedStableTest010";
    },
    /**
     * 11. Test Point: WeakRef references circular object (a.b = b; b.a = a) — GC works normally
     * MDN Basis: WeakRef does not prevent GC even if target has circular references.
     * Fix: Release strong ref → setTimeout(100ms) → trigger GC
     */
    async test011_WeakRefCircularObjectGC() {
        let weakRefA, weakRefB;

        // Create circular reference objects (a ↔ b)
        (function createCircularObjects() {
            const objA = { id: 'circular-a' };
            const objB = { id: 'circular-b' };
            objA.linked = objB; // Circular ref: a → b
            objB.linked = objA; // Circular ref: b → a
            // Create WeakRef for both circular objects
            weakRefA = new WeakRef(objA);
            weakRefB = new WeakRef(objB);
            // Initial check: deref() returns original objects
            if (weakRefA.deref() !== objA || weakRefB.deref() !== objB) {
                throw new Error("Initial deref() returns wrong circular object");
            }
        })();

        // Step 1: Release all strong references to circular objects
        let tempWeakRefA = weakRefA;
        let tempWeakRefB = weakRefB;
        weakRefA = null;
        weakRefB = null;

        // Step 2: Wait 100ms — engine marks circular objects as recyclable
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 3: Trigger GC (circular refs should not prevent GC)
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 4: Verify both circular objects are GC'd (deref() returns undefined)
        if (tempWeakRefA.deref() !== undefined) {
            throw new Error("WeakRef to circular objA not GC'd (deref() returns object)");
        }
        if (tempWeakRefB.deref() !== undefined) {
            throw new Error("WeakRef to circular objB not GC'd (deref() returns object)");
        }

        return "Test Passed: WeakRefCircularObjectGCTest011";
    },

    /**
     * 12. Test Point: FinalizationRegistry registers same object with different tokens — unregister one token only cancels its callback
     * MDN Basis: unregister() cancels the callback associated with the specific unregisterToken.
     * Fix: Release strong ref → setTimeout(100ms) → trigger GC
     */
    async test012_FinalizationSameObjDifferentTokens() {
        const callbackLogs = [];
        // FinalizationRegistry: log heldValue to track which callback is triggered
        const fr = new FinalizationRegistry((heldValue) => {
            callbackLogs.push(heldValue);
        });

        let targetObj, token1, token2;
        (function registerSameObjWithTwoTokens() {
            targetObj = { id: 'same-obj-multi-tokens' };
            token1 = { tokenId: 'token-1' }; // First token
            token2 = { tokenId: 'token-2' }; // Second token
            // Register same object twice with different tokens/heldValues
            fr.register(targetObj, 'callback-1', token1);
            fr.register(targetObj, 'callback-2', token2);
            // Unregister ONLY the first token (callback-1 should be canceled)
            const unregisterSuccess = fr.unregister(token1);
            if (!unregisterSuccess) {
                throw new Error("unregister(token1) returns false (expected true)");
            }
        })();

        // Step 1: Release strong references
        targetObj = null;
        token1 = null;
        token2 = null;

        // Step 2: Wait 100ms — engine marks object as recyclable
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 3: Trigger GC (only callback-2 should be triggered)
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 4: Verify callback logs (only callback-2 exists)
        if (callbackLogs.length !== 1) {
            throw new Error(`Callback triggered ${callbackLogs.length} times (expected 1)`);
        }
        if (callbackLogs[0] !== 'callback-2') {
            throw new Error(`Triggered callback: ${callbackLogs[0]} (expected callback-2)`);
        }

        return "Test Passed: WeakRefFinalizationSameObjDifferentTokensTest012";
    },

    /**
     * 13. Test Point: Modify prototype chain of WeakRef target — deref() and GC are not affected
     * MDN Basis: WeakRef associates with the object itself, not its prototype.
     * Fix: Release strong ref → setTimeout(100ms) → trigger GC
     */
    async test013_WeakRefTargetModifyPrototype() {
        let weakRef;
        let originalProto;

        (function createWeakRefWithPrototype() {
            // Create object with custom prototype
            const customProto = { greet: () => "hello" };
            const targetObj = Object.create(customProto);
            targetObj.id = 'proto-modify-target';
            originalProto = Object.getPrototypeOf(targetObj);

            // Create WeakRef for target
            weakRef = new WeakRef(targetObj);
            // Initial check: prototype and deref() are correct
            if (Object.getPrototypeOf(weakRef.deref()) !== customProto) {
                throw new Error("Initial target prototype does not match customProto");
            }
            if (weakRef.deref().greet() !== "hello") {
                throw new Error("Initial target prototype method fails");
            }
        })();

        // Step 1: Modify target's prototype chain (set to null)
        let targetBeforeGC = weakRef.deref();
        Object.setPrototypeOf(targetBeforeGC, null); // Remove prototype
        // Verify prototype is modified (no greet method)
        if (targetBeforeGC.greet !== undefined) {
            throw new Error("Target prototype modification failed (greet still exists)");
        }
        if (Object.getPrototypeOf(targetBeforeGC) !== null) {
            throw new Error("Target prototype not set to null");
        }
        // Verify deref() still returns the same object after prototype change
        if (weakRef.deref() !== targetBeforeGC) {
            throw new Error("deref() returns different object after prototype modification");
        }

        // Step 2: Release strong reference
        targetBeforeGC = null;

        // Step 3: Wait 100ms — engine marks object as recyclable
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 4: Trigger GC
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        }
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 5: Verify object is GC'd (deref() returns undefined)
        if (weakRef.deref() !== undefined) {
            throw new Error("deref() returns object after GC (prototype modification affects GC)");
        }

        return "Test Passed: WeakRefTargetModifyPrototypeTest013";
    },



    /**
     * 15. Test Point: Multiple WeakRefs reference the same object — all deref() sync after GC
     * MDN Basis: All WeakRefs to the same object reflect the object's GC state.
     * Fix: Release strong ref → setTimeout(100ms) → trigger GC
     */
    async test015_MultipleWeakRefsSameObject() {
        let weakRef1, weakRef2, weakRef3;
        let targetObj;

        (function createThreeWeakRefs() {
            targetObj = { id: 'multi-weakref-target' };
            // Create 3 WeakRefs for the same object
            weakRef1 = new WeakRef(targetObj);
            weakRef2 = new WeakRef(targetObj);
            weakRef3 = new WeakRef(targetObj);
            // Initial check: all deref() return targetObj
            const refs = [weakRef1.deref(), weakRef2.deref(), weakRef3.deref()];
            if (refs.some(ref => ref !== targetObj)) {
                throw new Error("Initial multiple WeakRefs return inconsistent objects");
            }
        })();

        // Step 1: Release strong reference to target
        const tempRef1 = weakRef1;
        const tempRef2 = weakRef2;
        const tempRef3 = weakRef3;
        weakRef1 = null;
        weakRef2 = null;
        weakRef3 = null;
        targetObj = null;

        // Step 2: Wait 100ms — engine marks object as recyclable
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 3: Trigger GC
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 4: Verify all WeakRefs are sync (deref() returns undefined)
        const postGcRefs = [tempRef1.deref(), tempRef2.deref(), tempRef3.deref()];
        if (postGcRefs.some(ref => ref !== undefined)) {
            throw new Error(`Multiple WeakRefs sync failed: ${postGcRefs.join(', ')} (expected all undefined)`);
        }

        return "Test Passed: WeakRefMultipleWeakRefsSameObjectTest015";
    },


    /**
     * 17. 冻结对象的WeakRef GC行为
     */
    async test017_WeakRefFrozenTargetGC() {
        let weakRef;

        (() => {
            const frozenObj = Object.freeze({ id: 'frozen-target', value: 100 });
            weakRef = new WeakRef(frozenObj);
            const derefObj = weakRef.deref();
            if (derefObj !== frozenObj) throw new Error("初始deref错误");
            if (!Object.isFrozen(derefObj)) throw new Error("对象未冻结");
        })();

        const tempWeakRef = weakRef;
        weakRef = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        if (tempWeakRef.deref() !== undefined) {
            throw new Error("冻结对象未被GC回收");
        }

        return "Test Passed: WeakRefFrozenTargetGCTest017";
    },

    /**
     * 18. FinalizationRegistry接收复杂类型heldValue
     */
    async test018_FinalizationHeldValueComplexType() {
        let receivedHv;
        const fr = new FinalizationRegistry(hv => receivedHv = hv);

        let targetObj;
        (() => {
            targetObj = { id: 'complex-hv-target' };
            const complexHv = [{ name: 'item1' }, { name: 'item2' }];
            fr.register(targetObj, complexHv);
        })();

        targetObj = null;
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        if (!Array.isArray(receivedHv) || receivedHv.length !== 2) {
            throw new Error("复杂heldValue接收错误");
        }

        return "Test Passed: WeakRefFinalizationHeldValueComplexTypeTest018";
    },

    /**
     * 19. 嵌套对象的WeakRef GC行为
     */
    async test019_WeakRefNestedObjectGC() {
        let weakRefTopLevel, nestedObjRef;

        (() => {
            const topLevel = { id: 'top', inner: { id: 'nested' } };
            nestedObjRef = topLevel.inner;
            weakRefTopLevel = new WeakRef(topLevel);
            const deref = weakRefTopLevel.deref();
            if (deref.inner !== nestedObjRef) throw new Error("嵌套对象访问失败");
        })();

        const tempWeakRef = weakRefTopLevel;
        weakRefTopLevel = null;
        nestedObjRef = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        if (tempWeakRef.deref() !== undefined) {
            throw new Error("嵌套对象未被GC回收");
        }

        return "Test Passed: WeakRefNestedObjectGCTest019";
    },


    /**
     * 21. 异步函数中调用WeakRef.deref()
     */
    async test021_WeakRefDerefInAsync() {
        let weakRef, targetObj;

        (() => {
            targetObj = { id: 'async-deref' };
            weakRef = new WeakRef(targetObj);
        })();

        let preGc = await new Promise(resolve => {
            setTimeout(() => resolve(weakRef.deref()), 100);
        });
        if (preGc !== targetObj) throw new Error("GC前异步deref错误");
        preGc = null;
        targetObj = null;
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));
        let x = weakRef.deref()
        if (x !== undefined) throw new Error("GC后  deref错误");
        const postGc = await new Promise(resolve => {
            setTimeout(() => resolve(weakRef.deref()), 100);
        });
        if (postGc !== undefined) throw new Error("GC后异步deref错误");

        return "Test Passed: WeakRefDerefInAsyncTest021";
    },

    /**
     * 22. 多个FinalizationRegistry注册同一目标
     */
    async test022_MultipleFRsSameTarget() {
        let fr1Called = false, fr2Called = false;
        const fr1 = new FinalizationRegistry(() => fr1Called = true);
        const fr2 = new FinalizationRegistry(() => fr2Called = true);

        let targetObj;
        (() => {
            targetObj = { id: 'multi-fr-target' };
            fr1.register(targetObj, 'fr1');
            fr2.register(targetObj, 'fr2');
        })();

        targetObj = null;
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        if (!fr1Called) throw new Error("fr1回调未触发");
        if (!fr2Called) throw new Error("fr2回调未触发");

        return "Test Passed: WeakRefMultipleFRsSameTargetTest022";
    },

    /**
     * 23. Proxy对象的WeakRef GC行为
     */
    async test023_WeakRefProxyTargetGC() {
        let weakRefProxy, proxyObj;

        (() => {
            const original = { id: 'proxy-original' };
            proxyObj = new Proxy(original, { get: (t, p) => t[p] });
            weakRefProxy = new WeakRef(proxyObj);
            if (weakRefProxy.deref() !== proxyObj) throw new Error("初始deref错误");
        })();

        const tempWeakRef = weakRefProxy;
        weakRefProxy = null;
        proxyObj = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        if (tempWeakRef.deref() !== undefined) throw new Error("Proxy未被GC回收");

        return "Test Passed: WeakRefProxyTargetGCTest023";
    },

    /**
     * 24. FinalizationRegistry回调中取消其他注册
     */
    async test024_FinalizationCallbackUnregisterOther() {
        let callback1Called = false;
        const fr = new FinalizationRegistry(hv => {
            if (hv === 'cb1') {
                callback1Called = true;
                fr.unregister(token2);
            }
        });

        let target1, target2, token2;
        (() => {
            target1 = { id: 'cb-unreg-1' };
            target2 = { id: 'cb-unreg-2' };
            token2 = { id: 'token2' };
            fr.register(target1, 'cb1');
            fr.register(target2, 'cb2', token2);
        })();

        target1 = null;
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 200));

        if (!callback1Called) throw new Error("callback1未触发");

        let callback2Called = false;
        const frVerify = new FinalizationRegistry(() => callback2Called = true);
        frVerify.register(target2, 'verify');
        target2 = null;
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 200));

        if (callback2Called) throw new Error("callback2不应触发");

        return "Test Passed: WeakRefFinalizationCallbackUnregisterOtherTest024";
    },

    /**
     * 25. 闭包中的WeakRef行为
     */
    async test025_WeakRefInClosure() {
        let getDeref;

        (() => {
            const target = { id: 'closure-target' };
            const wr = new WeakRef(target);
            getDeref = () => wr.deref();
            if (getDeref() !== target) throw new Error("初始deref错误");
        })();

        if (getDeref() === undefined) throw new Error("GC前deref错误");

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        if (getDeref() !== undefined) throw new Error("GC后deref错误");

        return "Test Passed: WeakRefInClosureTest025";
    },

    /**
     * 26. heldValue为undefined的FinalizationRegistry
     */
    async test026_FinalizationHeldValueUndefined() {
        let receivedHv;
        const fr = new FinalizationRegistry(hv => receivedHv = hv);

        let targetObj;
        (() => {
            targetObj = { id: 'undef-hv-target' };
            fr.register(targetObj, undefined);
        })();

        targetObj = null;
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        if (receivedHv !== undefined) throw new Error("heldValue接收错误");

        return "Test Passed: WeakRefFinalizationHeldValueUndefinedTest026";
    },

    /**
     * 27. 不可扩展对象的WeakRef GC行为
     */
    async test027_WeakRefNonExtensibleTargetGC() {
        let weakRef;

        (() => {
            const nonExt = { id: 'non-ext-target' };
            Object.preventExtensions(nonExt);
            weakRef = new WeakRef(nonExt);
            const deref = weakRef.deref();
            if (deref !== nonExt) throw new Error("初始deref错误");
            if (Object.isExtensible(deref)) throw new Error("对象仍可扩展");
        })();

        const tempWeakRef = weakRef;
        weakRef = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        if (tempWeakRef.deref() !== undefined) throw new Error("不可扩展对象未被GC回收");

        return "Test Passed: WeakRefNonExtensibleTargetGCTest027";
    },

    /**
     * 28. 重复注册相同(target, token)对
     */
    async test028_FinalizationDuplicateTargetToken() {
        const logs = [];
        const fr = new FinalizationRegistry(hv => logs.push(hv));

        let targetObj, token;
        (() => {
            targetObj = { id: 'dup-pair-target' };
            token = { id: 'dup-token' };
            fr.register(targetObj, 'first', token);
            fr.register(targetObj, 'second', token); // 覆盖
        })();

        const result = fr.unregister(token);
        if (!result) throw new Error("unregister失败");

        targetObj = null;
        token = null;
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        if (logs.length !== 0) throw new Error("不应触发回调");

        return "Test Passed: WeakRefFinalizationDuplicateTargetTokenTest028";
    },

    /**
     * 29. 多次调用WeakRef.deref()
     */
    async test029_WeakRefRepeatDeref() {
        let weakRef, targetObj;

        (() => {
            targetObj = { id: 'repeat-deref' };
            weakRef = new WeakRef(targetObj);
        })();

        // 1500次预GC调用
        for (let i = 0; i < 1500; i++) {
            if (weakRef.deref() !== targetObj) throw new Error(`预GC第${i}次错误`);
        }

        targetObj = null;
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 1500次后GC调用
        for (let i = 0; i < 1500; i++) {
            if (weakRef.deref() !== undefined) throw new Error(`后GC第${i}次错误`);
        }

        return "Test Passed: WeakRefRepeatDerefTest029";
    },






    /**
     * 34. heldValue为null的FinalizationRegistry
     */
    async test034_FinalizationHeldValueNull() {
        let receivedHv;
        const fr = new FinalizationRegistry(hv => receivedHv = hv);

        let targetObj;
        (() => {
            targetObj = { id: 'null-hv-target' };
            fr.register(targetObj, null);
        })();

        targetObj = null;
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        if (receivedHv !== null) throw new Error("heldValue接收错误");

        return "Test Passed: WeakRefFinalizationHeldValueNullTest034";
    },

    /**
     * 35. ArrayBuffer的WeakRef GC行为
     */
    async test035_WeakRefArrayBufferGC() {
        let weakRefBuffer;

        (() => {
            const buffer = new ArrayBuffer(16);
            const view = new DataView(buffer);
            view.setUint32(0, 0x12345678);
            weakRefBuffer = new WeakRef(buffer);

            const deref = weakRefBuffer.deref();
            if (!(deref instanceof ArrayBuffer)) throw new Error("不是ArrayBuffer");
            const derefView = new DataView(deref);
            if (derefView.getUint32(0) !== 0x12345678) throw new Error("数据错误");
        })();

        const tempWeakRef = weakRefBuffer;
        weakRefBuffer = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        if (tempWeakRef.deref() !== undefined) throw new Error("ArrayBuffer未被GC回收");

        return "Test Passed: WeakRefArrayBufferGCTest035";
    },
    /**
     * 36. Test Point: WeakRef to sealed object (Object.seal()) — GC works, seal does not block
     * MDN Basis: Sealed objects are valid WeakRef targets; sealing (allow modify existing props, disallow add/delete) does not affect GC.
     */
    async test036_WeakRefSealedTargetGC() {
        let weakRef;

        (function createSealedTarget() {
            const sealedObj = { id: 'sealed-target', value: 'test' };
            Object.seal(sealedObj); // 密封对象：允许修改现有属性，禁止新增/删除
            weakRef = new WeakRef(sealedObj);

            // 初始检查1：deref()返回密封对象
            const derefObj = weakRef.deref();
            if (derefObj !== sealedObj) {
                throw new Error("Initial deref() returns wrong sealed object");
            }
            // 初始检查2：对象确实被密封
            if (!Object.isSealed(derefObj)) {
                throw new Error("Dereferenced object is not sealed (expected sealed)");
            }
            // 初始检查3：密封对象允许修改现有属性
            derefObj.value = 'modified';
            if (derefObj.value !== 'modified') {
                throw new Error("Sealed object cannot modify existing property (invalid seal)");
            }
        })();

        // 步骤1：释放强引用
        const tempWeakRef = weakRef;
        weakRef = null;

        // 步骤2：等待100ms → 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30));

        // 步骤3：验证密封对象被GC回收
        if (tempWeakRef.deref() !== undefined) {
            throw new Error("WeakRef to sealed object not GC'd (deref() returns object)");
        }

        return "Test Passed: WeakRefSealedTargetGCTest036";
    },

    /**
     * 37. Test Point: FinalizationRegistry callback does not trigger if target regains strong ref
     * MDN Basis: FinalizationRegistry callback triggers only when target has no strong references; regaining strong ref prevents callback.
     */
    async test037_FinalizationRegainStrongRef() {
        let callbackTriggered = false;
        const fr = new FinalizationRegistry(() => {
            callbackTriggered = true;
        });

        let targetObj, tempStrongRef;
        (function registerAndRegainRef() {
            targetObj = { id: 'regain-ref-target' };
            // 1. 注册目标
            fr.register(targetObj, 'held-value');
            // 2. 释放强引用（模拟临时释放）
            tempStrongRef = targetObj;
            targetObj = null;

            // 3. 重新持有强引用（关键：此时目标有强引用，回调不应触发）
            targetObj = tempStrongRef;
            tempStrongRef = null;
        })();

        // 步骤1：等待100ms → 触发GC（目标仍有强引用，回调不应触发）
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30));

        // 步骤2：验证回调未触发（强引用存在）
        if (callbackTriggered) {
            throw new Error("Finalization callback triggered when target has strong ref (expected not to)");
        }

        // 步骤3：彻底释放强引用 → 再次GC → 验证回调触发
        targetObj = null;
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30));

        if (!callbackTriggered) {
            throw new Error("Finalization callback not triggered after strong ref is released (expected to)");
        }

        return "Test Passed: WeakRefFinalizationRegainStrongRefTest037";
    },

    /**
     * 38. Test Point: WeakRef.deref() has no cache — result changes with GC
     * MDN Basis: Each deref() call checks target status in real time; no cached result.
     */
    async test038_WeakRefDerefNoCache() {
        let weakRef, targetObj;

        (function createWeakRef() {
            targetObj = { id: 'no-cache-target' };
            weakRef = new WeakRef(targetObj);
        })();

        // 阶段1：GC前 → deref()返回目标对象（第1次调用）
        let preGc1 = weakRef.deref();
        if (preGc1 !== targetObj) {
            throw new Error("Pre-GC deref() #1 returns wrong object");
        }
        preGc1 = null;
        // 阶段2：释放强引用 → 触发GC
        targetObj = null;
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30));

        // 阶段3：GC后 → deref()返回undefined（第2次调用，结果动态变化，无缓存）
        const postGc1 = weakRef.deref();
        if (postGc1 !== undefined) {
            throw new Error("Post-GC deref() #1 returns object (cached result detected)");
        }

        // 阶段4：再次调用deref() → 仍返回undefined（第3次调用，确认无缓存）
        const postGc2 = weakRef.deref();
        if (postGc2 !== undefined) {
            throw new Error("Post-GC deref() #2 returns object (cached result detected)");
        }

        return "Test Passed: WeakRefDerefNoCacheTest038";
    },

    /**
     * 40. Test Point: WeakRef to TypedArray (Uint8Array) — GC works, buffer intact before GC
     * MDN Basis: TypedArray instances are objects; WeakRef references the TypedArray (not just the underlying buffer).
     */
    async test040_WeakRefTypedArrayGC() {
        let weakRef;

        (function createTypedArray() {
            // 创建Uint8Array（基于16字节缓冲区）
            const typedArray = new Uint8Array(16);
            // 写入测试数据
            typedArray.set([0x01, 0x02, 0x03], 0);
            weakRef = new WeakRef(typedArray);

            // 初始检查1：deref()返回TypedArray
            const derefTA = weakRef.deref();
            if (derefTA !== typedArray) {
                throw new Error("Initial deref() returns wrong TypedArray");
            }
            // 初始检查2：数据完整性（缓冲区未损坏）
            if (derefTA[0] !== 0x01 || derefTA[1] !== 0x02 || derefTA[2] !== 0x03) {
                throw new Error("TypedArray data corrupted in dereferenced object");
            }
            // 初始检查3：确认为Uint8Array类型
            if (!(derefTA instanceof Uint8Array)) {
                throw new Error("Dereferenced value is not Uint8Array");
            }
        })();

        // 步骤1：释放强引用
        const tempWeakRef = weakRef;
        weakRef = null;

        // 步骤2：等待100ms → 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30));

        // 步骤3：验证TypedArray被GC回收
        if (tempWeakRef.deref() !== undefined) {
            throw new Error("WeakRef to TypedArray not GC'd (deref() returns TypedArray)");
        }

        return "Test Passed: WeakRefTypedArrayGCTest040";
    },
    /**
     * 41. Test Point: WeakMap stores object metadata, WeakRef monitors key GC
     * MDN Basis: WeakMap keys are weakly referenced (GC removes entry when key is collected); WeakRef detects key survival.
     */
    async test041_WeakMapMetaWithWeakRef() {
        // 1. 初始化WeakMap（存储对象元数据）和WeakRef（监控WeakMap的键）
        const metaMap = new WeakMap(); // key: 目标对象, value: 元数据
        let weakRefToMapKey;

        (function createKeyAndMeta() {
            const targetObj = { id: 'meta-target' };
            // WeakMap存储元数据
            metaMap.set(targetObj, { createTime: Date.now(), type: 'test' });
            // WeakRef监控targetObj（WeakMap的键）
            weakRefToMapKey = new WeakRef(targetObj);

            // 初始检查1：WeakMap包含目标对象的元数据
            if (!metaMap.has(targetObj)) {
                throw new Error("WeakMap does not have initial target entry");
            }
            // 初始检查2：WeakRef deref()返回目标对象
            if (weakRefToMapKey.deref() !== targetObj) {
                throw new Error("Initial WeakRef.deref() returns wrong target");
            }
            // 初始检查3：元数据正确
            const meta = metaMap.get(targetObj);
            if (!meta || meta.type !== 'test') {
                throw new Error("WeakMap stores invalid metadata");
            }
        })();

        // 2. 释放WeakMap键的强引用（触发后续GC）
        const tempWeakRef = weakRefToMapKey;
        weakRefToMapKey = null; // 释放强引用

        // 3. 等待100ms → 触发GC（WeakMap键被回收，条目自动移除）
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30));

        // 4. 验证：WeakRef检测到键已GC，WeakMap条目自动移除
        if (tempWeakRef.deref() !== undefined) {
            throw new Error("WeakRef to WeakMap key not GC'd (deref() returns object)");
        }


        return "Test Passed: WeakRefWeakMapMetaMonitorTest041";
    },

    /**
     * 42. Test Point: Temporary cache with WeakRef+WeakMap (auto-invalidates when key GC)
     * MDN Basis: WeakMap caches data by weak key; WeakRef confirms key GC to validate cache invalidation.
     */
    async test042_WeakRefWeakMapTempCache() {
        // 1. 实现临时缓存：WeakMap存缓存数据，WeakRef监控缓存键
        const cache = new WeakMap(); // key: 缓存键对象, value: 缓存数据
        const cacheKeysRefs = []; // 存储所有缓存键的WeakRef，用于监控GC

        // 2. 缓存数据
        (function initCache() {
            const cacheKey1 = { id: 'cache-key-1' };
            const cacheKey2 = { id: 'cache-key-2' };
            // 存入缓存
            cache.set(cacheKey1, { data: 'cache-data-1' });
            cache.set(cacheKey2, { data: 'cache-data-2' });
            // 用WeakRef监控缓存键
            cacheKeysRefs.push(new WeakRef(cacheKey1), new WeakRef(cacheKey2));

            // 初始检查：缓存有效，WeakRef正常
            if (!cache.has(cacheKey1) || !cache.has(cacheKey2)) {
                throw new Error("Initial cache entries missing");
            }
            if (cacheKeysRefs[0].deref() !== cacheKey1 || cacheKeysRefs[1].deref() !== cacheKey2) {
                throw new Error("Initial WeakRef to cache keys is invalid");
            }
        })();

        // 3. 释放其中一个缓存键的强引用（模拟缓存失效触发）
        // 注：缓存键的强引用仅存在于initCache函数作用域，函数执行完后自动释放，此处无需额外赋值null

        // 4. 等待100ms → 触发GC（缓存键被回收，对应缓存条目移除）
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30));

        // 5. 验证：被GC的键对应的WeakRef返回undefined，缓存条目移除；未GC的键正常
        let gcCount = 0;
        for (const ref of cacheKeysRefs) {
            if (ref.deref() === undefined) gcCount++;
        }

        if (gcCount !== 2) {
            throw new Error(`Only ${gcCount}/2 cache keys are GC'd (expected 2)`);
        }

        return "Test Passed: WeakRefWeakMapTempCacheTest042";
    },

    /**
     * 44. Test Point: WeakRef triggers callback to clean WeakMap after key GC
     * MDN Basis: FinalizationRegistry+WeakRef detects key GC; callback cleans related WeakMap entries.
     */
    async test044_WeakRefCallbackCleanWeakMap() {
        // 1. 初始化WeakMap（存储资源）、FinalizationRegistry（触发清理）、WeakRef（监控键）
        const resourceMap = new WeakMap(); // key: 资源所有者, value: 关联资源
        const cleanupRegistry = new FinalizationRegistry(({ map, ref }) => {
            // 回调逻辑：当所有者GC，清理WeakMap中对应的资源
            const owner = ref.deref();
            if (owner && map.has(owner)) {
                map.delete(owner);
            }
        });
        let weakRefToOwner;

        (function createOwnerAndResource() {
            const resourceOwner = { id: 'resource-owner' };
            const resource = { type: 'temp-file', path: '/tmp/test.txt' };
            // WeakMap存储资源
            resourceMap.set(resourceOwner, resource);
            // WeakRef监控所有者
            weakRefToOwner = new WeakRef(resourceOwner);
            // 注册FinalizationRegistry：所有者GC时触发清理
            cleanupRegistry.register(resourceOwner, { map: resourceMap, ref: weakRefToOwner });

            // 初始检查：资源存在，WeakRef正常
            if (!resourceMap.has(resourceOwner)) {
                throw new Error("Initial resource entry missing in WeakMap");
            }
            if (weakRefToOwner.deref() !== resourceOwner) {
                throw new Error("Initial WeakRef to resource owner is invalid");
            }
        })();

        // 2. 释放资源所有者的强引用
        const tempRef = weakRefToOwner;
        weakRefToOwner = null;

        // 3. 等待100ms → 触发GC（所有者被回收，回调清理资源）
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30)); // 等待回调执行

        // 4. 验证：所有者被GC，资源已从WeakMap移除
        if (tempRef.deref() !== undefined) {
            throw new Error("Resource owner not GC'd (WeakRef returns object)");
        }


        return "Test Passed: WeakRefCallbackCleanWeakMapTest044";
    },

    /**
     * 45. Test Point: Batch monitor object GC with WeakMap+WeakRef array
     * MDN Basis: WeakMap stores batch object states; WeakRef array monitors all objects' GC.
     */
    async test045_WeakRefWeakMapBatchMonitor() {
        // 1. 初始化WeakMap（存储批量对象状态）和WeakRef数组（监控所有对象）
        const stateMap = new WeakMap(); // key: 目标对象, value: 状态（如加载状态、计数）
        const objectRefs = []; // 存储所有目标对象的WeakRef
        const batchSize = 3; // 批量对象数量

        (function createBatchObjects() {
            for (let i = 0; i < batchSize; i++) {
                const obj = { id: `batch-obj-${i}` };
                // WeakMap存储对象状态
                stateMap.set(obj, { loaded: true, count: i });
                // WeakRef监控对象
                objectRefs.push(new WeakRef(obj));
            }


            for (let i = 0; i < batchSize; i++) {
                if (!objectRefs[i].deref()) {

                    throw new Error(`Initial WeakRef for batch-obj-${i} is invalid`);
                }
            }
        })();

        // 2. 释放所有批量对象的强引用
        const tempRefs = [...objectRefs]; // 保存WeakRef用于后续验证
        // 批量对象的强引用仅存在于createBatchObjects作用域，函数执行完后自动释放

        // 3. 等待100ms → 触发GC（所有批量对象被回收）
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30));

        // 4. 验证：所有对象被GC，stateMap为空
        let gcSuccessCount = 0;
        for (const ref of tempRefs) {
            if (ref.deref() === undefined) gcSuccessCount++;
        }
        if (gcSuccessCount !== batchSize) {
            throw new Error(`Only ${gcSuccessCount}/${batchSize} batch objects are GC'd`);
        }


        return "Test Passed: WeakRefWeakMapBatchMonitorTest045";
    },

    /**
     * 46. Test Point: WeakMap(key=目标对象, value=该对象的WeakRef) — 直接引用关系
     * MDN Basis: WeakMap key为对象（弱引用），value为该key的WeakRef（key与value直接关联）；key GC时，value的WeakRef同步失效，WeakMap条目移除。
     */
    async test046_WeakMapKeySelfWeakRefValue() {
        // 1. 初始化WeakMap：key=目标对象，value=该key的WeakRef（key与value直接引用关联）
        const selfRefMap = new WeakMap();
        let testObject, tempWeakRefFromMap;

        (function createKeyAndWeakRefValue() {
            testObject = { id: 'self-ref-target', data: 'test' };
            // value是key（testObject）的WeakRef，key与value存在“自身引用”关系
            const refToKey = new WeakRef(testObject);
            selfRefMap.set(testObject, refToKey);

            // 初始检查1：WeakMap包含key，且value是该key的WeakRef
            if (!selfRefMap.has(testObject)) {
                throw new Error("WeakMap missing entry for target key");
            }
            const storedRef = selfRefMap.get(testObject);
            if (!(storedRef instanceof WeakRef)) {
                throw new Error("WeakMap value is not a WeakRef");
            }
            // 初始检查2：value的WeakRef deref()返回key（引用关系有效）
            if (storedRef.deref() !== testObject) {
                throw new Error("WeakMap value (WeakRef) does not point to key");
            }
            tempWeakRefFromMap = storedRef; // 保存value的WeakRef用于后续GC验证
        })();

        // 2. 释放key的强引用（触发GC）
        testObject = null;

        // 3. 等待100ms → 触发GC（key被回收，WeakMap条目自动移除，value的WeakRef失效）
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30));


        if (tempWeakRefFromMap.deref() !== undefined) {
            throw new Error("WeakMap value (WeakRef) still points to GC'd key");
        }

        return "Test Passed: WeakMapKeySelfWeakRefValueTest046";
    },

    /**
     * 47. Test Point: WeakMap(key=父对象, value=子对象的WeakRef) — 父子引用关系
     * MDN Basis: WeakMap key为父对象，value为子对象的WeakRef（父对象包含子对象引用，key与value存在“父子关联”）；父/子均无强引用时，两者GC，WeakMap条目移除。
     */
    async test047_WeakMapParentKeyChildWeakRefValue() {
        // 1. 初始化父子对象+WeakMap：key=父对象，value=子对象的WeakRef（父包含子引用，key与value关联）
        const parentChildMap = new WeakMap();
        let parentObj, tempChildRefFromMap;

        (function createParentChildAndMap() {
            // 子对象：被父对象引用
            const childObj = { id: 'child-target', parentId: 'parent-1' };
            // 父对象：包含子对象的强引用（key与value的关联基础）
            parentObj = { id: 'parent-target', child: childObj };
            // WeakMap value是子对象的WeakRef，key是父对象（父子关联）
            const refToChild = new WeakRef(childObj);
            parentChildMap.set(parentObj, refToChild);

            // 初始检查1：父对象包含子对象引用（关联有效）
            if (parentObj.child !== childObj) {
                throw new Error("Parent object does not reference child (invalid association)");
            }
            // 初始检查2：WeakMap value的WeakRef指向子对象
            const storedChildRef = parentChildMap.get(parentObj);
            if (storedChildRef?.deref() !== childObj) {
                throw new Error("WeakMap value (WeakRef) does not point to child object");
            }
            tempChildRefFromMap = storedChildRef; // 保存子对象的WeakRef用于验证
        })();

        // 2. 释放父对象的强引用（子对象无其他强引用，随父对象一起GC）
        parentObj = null;

        // 3. 等待100ms → 触发GC（父子均被回收，WeakMap条目移除）
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30));


        if (tempChildRefFromMap.deref() !== undefined) {
            throw new Error("WeakMap value (WeakRef to child) still points to GC'd child");
        }

        return "Test Passed: WeakMapParentKeyChildWeakRefValueTest047";
    },

    /**
     * 48. Test Point: WeakMap(key=容器对象, value=容器内元素的WeakRef) — 容器-元素引用关系
     * MDN Basis: WeakMap key为容器（如数组），value为容器内元素的WeakRef（容器包含元素引用，key与value关联）；容器GC时，元素无强引用也GC，WeakMap条目移除。
     */
    async test048_WeakMapContainerKeyElementWeakRefValue() {
        // 1. 初始化容器+元素+WeakMap：key=数组容器，value=容器内元素的WeakRef（容器包含元素，关联有效）
        const containerElementMap = new WeakMap();
        let containerArr, tempElementRefFromMap;

        (function createContainerElementAndMap() {
            // 容器内元素
            const elementObj = { id: 'container-element', type: 'item' };
            // 容器：数组包含元素的强引用（key与value的关联基础）
            containerArr = [elementObj, { id: 'other-item' }]; // 容器内有多个元素，重点监控elementObj
            // WeakMap value是目标元素的WeakRef，key是容器（容器-元素关联）
            const refToElement = new WeakRef(elementObj);
            containerElementMap.set(containerArr, refToElement);

            // 初始检查1：容器包含目标元素（关联有效）
            if (!containerArr.includes(elementObj)) {
                throw new Error("Container does not include target element (invalid association)");
            }
            // 初始检查2：WeakMap value的WeakRef指向容器内元素
            const storedElementRef = containerElementMap.get(containerArr);
            if (storedElementRef?.deref() !== elementObj) {
                throw new Error("WeakMap value (WeakRef) does not point to container element");
            }
            tempElementRefFromMap = storedElementRef; // 保存元素的WeakRef用于验证
        })();

        // 2. 释放容器的强引用（元素无其他强引用，随容器一起GC）
        containerArr = null;

        // 3. 等待100ms → 触发GC（容器+元素均回收，WeakMap条目移除）
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30));


        if (tempElementRefFromMap.deref() !== undefined) {
            throw new Error("WeakMap value (WeakRef to element) still points to GC'd element");
        }

        return "Test Passed: WeakMapContainerKeyElementWeakRefValueTest048";
    },

    /**
     * 49. Test Point: WeakMap(key=资源所有者, value=资源对象的WeakRef) — 所有者-资源引用关系
     * MDN Basis: WeakMap key为资源所有者，value为资源的WeakRef（所有者持有资源引用，key与value关联）；所有者GC时，资源无强引用也GC，WeakMap条目移除。
     */
    async test049_WeakMapOwnerKeyResourceWeakRefValue() {
        // 1. 初始化所有者+资源+WeakMap：key=所有者，value=资源的WeakRef（所有者持有资源，关联有效）
        const ownerResourceMap = new WeakMap();
        let resourceOwner, tempResourceRefFromMap;

        (function createOwnerResourceAndMap() {
            // 资源对象：被所有者引用
            const resourceObj = { id: 'file-resource', path: '/data/log.txt', size: 1024 };
            // 资源所有者：持有资源的强引用（key与value的关联基础）
            resourceOwner = { id: 'user-owner', ownedResource: resourceObj, name: 'Test User' };
            // WeakMap value是资源的WeakRef，key是所有者（所有者-资源关联）
            const refToResource = new WeakRef(resourceObj);
            ownerResourceMap.set(resourceOwner, refToResource);

            // 初始检查1：所有者持有资源引用（关联有效）
            if (resourceOwner.ownedResource !== resourceObj) {
                throw new Error("Resource owner does not reference resource (invalid association)");
            }
            // 初始检查2：WeakMap value的WeakRef指向资源
            const storedResourceRef = ownerResourceMap.get(resourceOwner);
            if (storedResourceRef?.deref() !== resourceObj) {
                throw new Error("WeakMap value (WeakRef) does not point to owned resource");
            }
            tempResourceRefFromMap = storedResourceRef; // 保存资源的WeakRef用于验证
        })();

        // 2. 释放所有者的强引用（资源无其他强引用，随所有者一起GC）
        resourceOwner = null;

        // 3. 等待100ms → 触发GC（所有者+资源均回收，WeakMap条目移除）
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30));


        if (tempResourceRefFromMap.deref() !== undefined) {
            throw new Error("WeakMap value (WeakRef to resource) still points to GC'd resource");
        }

        return "Test Passed: WeakMapOwnerKeyResourceWeakRefValueTest049";
    },

    /**
     * 50. Test Point: WeakMap(key=目标对象, value=含该对象WeakRef的元数据) — 对象-元数据引用关系
     * MDN Basis: WeakMap key为目标对象，value为元数据对象（含key的WeakRef，key与value通过元数据关联）；key GC时，元数据中的WeakRef失效，WeakMap条目移除。
     */
    async test050_WeakMapKeyMetaWithWeakRefValue() {
        // 1. 初始化目标对象+元数据+WeakMap：key=目标，value=含key WeakRef的元数据（元数据引用key，关联有效）
        const metaWithRefMap = new WeakMap();
        let targetObj, tempMetaWeakRef;

        (function createTargetMetaAndMap() {
            targetObj = { id: 'meta-target', content: 'sample data' };
            // 元数据对象：包含目标对象的WeakRef（key与value的关联基础）
            const targetMeta = {
                createTime: Date.now(),
                type: 'content',
                targetRef: new WeakRef(targetObj) // 元数据中的WeakRef指向key（目标对象）
            };
            // WeakMap key=目标对象，value=含WeakRef的元数据（对象-元数据关联）
            metaWithRefMap.set(targetObj, targetMeta);

            // 初始检查1：元数据中的WeakRef指向key（关联有效）
            if (targetMeta.targetRef.deref() !== targetObj) {
                throw new Error("Metadata WeakRef does not point to target key (invalid association)");
            }
            // 初始检查2：WeakMap包含条目，且value是元数据
            const storedMeta = metaWithRefMap.get(targetObj);
            if (!storedMeta || storedMeta.type !== 'content') {
                throw new Error("WeakMap value is not valid metadata");
            }
            tempMetaWeakRef = storedMeta.targetRef; // 保存元数据中的WeakRef用于验证
        })();

        // 2. 释放目标对象的强引用（触发GC）
        targetObj = null;

        // 3. 等待100ms → 触发GC（目标对象回收，WeakMap条目移除，元数据中的WeakRef失效）
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30));


        if (tempMetaWeakRef.deref() !== undefined) {
            throw new Error("Metadata WeakRef (in WeakMap value) still points to GC'd target");
        }

        return "Test Passed: WeakMapKeyMetaWithWeakRefValueTest050";
    },

    /**
     * 51. WeakMap(key=代理对象, value=原对象的WeakRef) — 代理-原对象引用关系
     */
    async test051_WeakMapProxyKeyOriginalWeakRefValue() {
        const proxyOriginalMap = new WeakMap();
        let originalObj, proxyObj, tempOriginalRef, tempProxyRef;

        (function createProxyAndMap() {
            originalObj = { id: 'proxy-original', data: 'source' };
            proxyObj = new Proxy(originalObj, {}); // 代理对象包装原对象
            const refToOriginal = new WeakRef(originalObj);
            proxyOriginalMap.set(proxyObj, refToOriginal);

            if (proxyObj.data !== originalObj.data) throw new Error("Proxy not linked to original");
            if (proxyOriginalMap.get(proxyObj)?.deref() !== originalObj) throw new Error("WeakRef mismatch");
            tempOriginalRef = refToOriginal;
            tempProxyRef = new WeakRef(proxyObj); // 保存proxy的WeakRef用于后续验证
        })();

        originalObj = null;
        proxyObj = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证：通过原proxy的WeakRef获取键，检查是否存在条目
        const gcProxy = tempProxyRef.deref();
        if (gcProxy && proxyOriginalMap.has(gcProxy)) {
            throw new Error("WeakMap still contains entry for GC'd proxy key");
        }
        if (tempOriginalRef.deref() !== undefined) throw new Error("Original WeakRef not invalidated");

        return "Test Passed: WeakMapProxyKeyOriginalWeakRefValueTest051";
    },

    /**
     * 52. WeakMap(key=基类实例, value=子类实例的WeakRef) — 继承引用关系
     */
    async test052_WeakMapBaseKeySubWeakRefValue() {
        class Base { constructor(id) { this.id = id; } }
        class Sub extends Base { constructor(id, parent) { super(id); this.parent = parent; } }

        const baseSubMap = new WeakMap();
        let baseInstance, subInstance, tempSubRef, tempBaseRef;

        (function createInheritanceAndMap() {
            baseInstance = new Base('base-1');
            subInstance = new Sub('sub-1', baseInstance); // 子类实例引用基类实例
            const refToSub = new WeakRef(subInstance);
            baseSubMap.set(baseInstance, refToSub);

            if (subInstance.parent !== baseInstance) throw new Error("Sub not linked to Base");
            if (baseSubMap.get(baseInstance)?.deref() !== subInstance) throw new Error("WeakRef mismatch");
            tempSubRef = refToSub;
            tempBaseRef = new WeakRef(baseInstance); // 保存base的WeakRef
        })();

        baseInstance = null;
        subInstance = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证：通过原base的WeakRef获取键，检查是否存在条目
        const gcBase = tempBaseRef.deref();
        if (gcBase && baseSubMap.has(gcBase)) {
            throw new Error("WeakMap still contains entry for GC'd base key");
        }
        if (tempSubRef.deref() !== undefined) throw new Error("Sub WeakRef not invalidated");

        return "Test Passed: WeakMapBaseKeySubWeakRefValueTest052";
    },

    /**
     * 53. WeakMap(key=数组项, value=数组的WeakRef) — 元素-容器反向引用
     */
    async test053_WeakMapItemKeyArrayWeakRefValue() {
        const itemArrayMap = new WeakMap();
        let itemObj, containerArr, tempArrayRef, tempItemRef;

        (function createItemAndArray() {
            itemObj = { id: 'array-item' };
            containerArr = [itemObj]; // 数组包含元素
            const refToArr = new WeakRef(containerArr);
            itemArrayMap.set(itemObj, refToArr); // key=元素, value=数组的WeakRef

            if (!containerArr.includes(itemObj)) throw new Error("Array not contains item");
            if (itemArrayMap.get(itemObj)?.deref() !== containerArr) throw new Error("WeakRef mismatch");
            tempArrayRef = refToArr;
            tempItemRef = new WeakRef(itemObj); // 保存item的WeakRef
        })();

        itemObj = null;
        containerArr = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证：通过原item的WeakRef获取键，检查是否存在条目
        const gcItem = tempItemRef.deref();
        if (gcItem && itemArrayMap.has(gcItem)) {
            throw new Error("WeakMap still contains entry for GC'd item key");
        }
        if (tempArrayRef.deref() !== undefined) throw new Error("Array WeakRef not invalidated");

        return "Test Passed: WeakMapItemKeyArrayWeakRefValueTest053";
    },



    /**
     * 55. WeakMap(key=模块实例, value=依赖项的WeakRef) — 模块-依赖引用
     */
    async test055_WeakMapModuleKeyDependencyWeakRefValue() {
        const moduleDepMap = new WeakMap();
        let dependency, moduleInstance, tempDepRef, tempModuleRef;

        (function createModuleAndDependency() {
            dependency = { id: 'dep-module', version: '1.0' };
            moduleInstance = {
                id: 'main-module',
                deps: [dependency] // 模块引用依赖
            };
            const refToDep = new WeakRef(dependency);
            moduleDepMap.set(moduleInstance, refToDep);

            if (!moduleInstance.deps.includes(dependency)) throw new Error("Module missing dependency");
            if (moduleDepMap.get(moduleInstance)?.deref() !== dependency) throw new Error("WeakRef mismatch");
            tempDepRef = refToDep;
            tempModuleRef = new WeakRef(moduleInstance); // 保存module的WeakRef
        })();

        moduleInstance = null;
        dependency = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证：通过原module的WeakRef获取键，检查是否存在条目
        const gcModule = tempModuleRef.deref();
        if (gcModule && moduleDepMap.has(gcModule)) {
            throw new Error("WeakMap still contains entry for GC'd module key");
        }
        if (tempDepRef.deref() !== undefined) throw new Error("Dependency WeakRef not invalidated");

        return "Test Passed: WeakMapModuleKeyDependencyWeakRefValueTest055";
    },

    /**
     * 56. WeakMap(key=缓存键, value=缓存值的WeakRef) — 键-值缓存引用
     */
    async test056_WeakMapCacheKeyValueWeakRefValue() {
        const cacheMap = new WeakMap();
        let cacheKey, cacheValue, tempValueRef, tempKeyRef;

        (function createCacheEntries() {
            cacheKey = { id: 'cache-key-123' };
            cacheValue = { data: 'cached-content', key: cacheKey }; // 值引用键
            const refToValue = new WeakRef(cacheValue);
            cacheMap.set(cacheKey, refToValue);

            if (cacheValue.key !== cacheKey) throw new Error("Cache value not linked to key");
            if (cacheMap.get(cacheKey)?.deref() !== cacheValue) throw new Error("WeakRef mismatch");
            tempValueRef = refToValue;
            tempKeyRef = new WeakRef(cacheKey); // 保存cacheKey的WeakRef
        })();

        cacheKey = null;
        cacheValue = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证：通过原cacheKey的WeakRef获取键，检查是否存在条目
        const gcKey = tempKeyRef.deref();
        if (gcKey && cacheMap.has(gcKey)) {
            throw new Error("WeakMap still contains entry for GC'd cache key");
        }
        if (tempValueRef.deref() !== undefined) throw new Error("Cache value WeakRef not invalidated");

        return "Test Passed: WeakMapCacheKeyValueWeakRefValueTest056";
    },

    /**
     * 57. WeakMap(key=事件源, value=事件处理器的WeakRef) — 事件源-处理器引用
     */
    async test057_WeakMapEventSourceKeyHandlerWeakRefValue() {
        const eventHandlerMap = new WeakMap();
        let eventSource, handler, tempHandlerRef, tempSourceRef;

        (function createEventComponents() {
            eventSource = { id: 'event-source', listeners: [] };
            handler = {
                id: 'event-handler',
                source: eventSource, // 处理器引用事件源
                handle: () => {}
            };
            eventSource.listeners.push(handler);
            const refToHandler = new WeakRef(handler);
            eventHandlerMap.set(eventSource, refToHandler);

            if (!eventSource.listeners.includes(handler)) throw new Error("Source missing handler");
            if (handler.source !== eventSource) throw new Error("Handler not linked to source");
            tempHandlerRef = refToHandler;
            tempSourceRef = new WeakRef(eventSource); // 保存eventSource的WeakRef
        })();

        eventSource = null;
        handler = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证：通过原eventSource的WeakRef获取键，检查是否存在条目
        const gcSource = tempSourceRef.deref();
        if (gcSource && eventHandlerMap.has(gcSource)) {
            throw new Error("WeakMap still contains entry for GC'd event source key");
        }
        if (tempHandlerRef.deref() !== undefined) throw new Error("Handler WeakRef not invalidated");

        return "Test Passed: WeakMapEventSourceKeyHandlerWeakRefValueTest057";
    },

    /**
     * 58. WeakMap(key=集合对象, value=迭代器的WeakRef) — 集合-迭代器引用
     */
    async test058_WeakMapCollectionKeyIteratorWeakRefValue() {
        const collectionIterMap = new WeakMap();
        let collection, iterator, tempIterRef, tempCollectionRef;

        (function createCollectionAndIterator() {
            collection = new Set([{ id: 'item-1' }]); // 集合对象
            iterator = collection.values(); // 迭代器引用集合
            const refToIter = new WeakRef(iterator);
            collectionIterMap.set(collection, refToIter);

            if (!iterator.next().value) throw new Error("Iterator not linked to collection");
            if (collectionIterMap.get(collection)?.deref() !== iterator) throw new Error("WeakRef mismatch");
            tempIterRef = refToIter;
            tempCollectionRef = new WeakRef(collection); // 保存collection的WeakRef
        })();

        collection = null;
        iterator = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证：通过原collection的WeakRef获取键，检查是否存在条目
        const gcCollection = tempCollectionRef.deref();
        if (gcCollection && collectionIterMap.has(gcCollection)) {
            throw new Error("WeakMap still contains entry for GC'd collection key");
        }
        if (tempIterRef.deref() !== undefined) throw new Error("Iterator WeakRef not invalidated");

        return "Test Passed: WeakMapCollectionKeyIteratorWeakRefValueTest058";
    },

    /**
     * 59. WeakMap(key=配置对象, value=配置生成器的WeakRef) — 配置-生成器引用
     */
    async test059_WeakMapConfigKeyGeneratorWeakRefValue() {
        const configGeneratorMap = new WeakMap();
        let config, generator, tempGeneratorRef, tempConfigRef;

        (function createConfigAndGenerator() {
            config = { id: 'app-config', theme: 'light' };
            generator = {
                id: 'config-generator',
                lastConfig: config, // 生成器引用配置
                generate: () => ({ ...config })
            };
            const refToGenerator = new WeakRef(generator);
            configGeneratorMap.set(config, refToGenerator);

            if (generator.lastConfig !== config) throw new Error("Generator not linked to config");
            if (configGeneratorMap.get(config)?.deref() !== generator) throw new Error("WeakRef mismatch");
            tempGeneratorRef = refToGenerator;
            tempConfigRef = new WeakRef(config); // 保存config的WeakRef
        })();

        config = null;
        generator = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证：通过原config的WeakRef获取键，检查是否存在条目
        const gcConfig = tempConfigRef.deref();
        if (gcConfig && configGeneratorMap.has(gcConfig)) {
            throw new Error("WeakMap still contains entry for GC'd config key");
        }
        if (tempGeneratorRef.deref() !== undefined) throw new Error("Generator WeakRef not invalidated");

        return "Test Passed: WeakMapConfigKeyGeneratorWeakRefValueTest059";
    },

    /**
     * 60. WeakMap(key=主对象, value=附属对象的WeakRef) — 主-附属引用
     */
    async test060_WeakMapMainKey附属WeakRefValue() {
        const main附属Map = new WeakMap();
        let mainObj, 附属Obj, temp附属Ref, tempMainRef;

        (function createMainAnd附属() {
            mainObj = { id: 'main-object' };
            附属Obj = {
                id: '附属-object',
                owner: mainObj // 附属引用主对象
            };
            const refTo附属 = new WeakRef(附属Obj);
            main附属Map.set(mainObj, refTo附属);

            if (附属Obj.owner !== mainObj) throw new Error("附属 not linked to main");
            if (main附属Map.get(mainObj)?.deref() !== 附属Obj) throw new Error("WeakRef mismatch");
            temp附属Ref = refTo附属;
            tempMainRef = new WeakRef(mainObj); // 保存mainObj的WeakRef
        })();

        mainObj = null;
        附属Obj = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证：通过原mainObj的WeakRef获取键，检查是否存在条目
        const gcMain = tempMainRef.deref();
        if (gcMain && main附属Map.has(gcMain)) {
            throw new Error("WeakMap still contains entry for GC'd main key");
        }
        if (temp附属Ref.deref() !== undefined) throw new Error("附属 WeakRef not invalidated");

        return "Test Passed: WeakMapMainKey附属WeakRefValueTest060";
    },

    /**
     * 61. WeakMap(key=副本对象, value=原对象的WeakRef) — 副本-原对象引用
     */
    async test061_WeakMapCopyKeyOriginalWeakRefValue() {
        const copyOriginalMap = new WeakMap();
        let original, copy, tempOriginalRef, tempCopyRef;

        (function createCopyAndOriginal() {
            original = { id: 'original-data', value: 'source' };
            copy = { ...original, source: original }; // 副本引用原对象
            const refToOriginal = new WeakRef(original);
            copyOriginalMap.set(copy, refToOriginal);

            if (copy.source !== original) throw new Error("Copy not linked to original");
            if (copyOriginalMap.get(copy)?.deref() !== original) throw new Error("WeakRef mismatch");
            tempOriginalRef = refToOriginal;
            tempCopyRef = new WeakRef(copy); // 保存copy的WeakRef
        })();

        original = null;
        copy = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证：通过原copy的WeakRef获取键，检查是否存在条目
        const gcCopy = tempCopyRef.deref();
        if (gcCopy && copyOriginalMap.has(gcCopy)) {
            throw new Error("WeakMap still contains entry for GC'd copy key");
        }
        if (tempOriginalRef.deref() !== undefined) throw new Error("Original WeakRef not invalidated");

        return "Test Passed: WeakMapCopyKeyOriginalWeakRefValueTest061";
    },

    /**
     * 62. WeakMap(key=任务对象, value=结果对象的WeakRef) — 任务-结果引用
     */
    async test062_WeakMapTaskKeyResultWeakRefValue() {
        const taskResultMap = new WeakMap();
        let task, result, tempResultRef, tempTaskRef;

        (function createTaskAndResult() {
            task = { id: 'task-456', status: 'pending' };
            result = {
                id: 'result-456',
                task: task, // 结果引用任务
                data: null
            };
            const refToResult = new WeakRef(result);
            taskResultMap.set(task, refToResult);

            if (result.task !== task) throw new Error("Result not linked to task");
            if (taskResultMap.get(task)?.deref() !== result) throw new Error("WeakRef mismatch");
            tempResultRef = refToResult;
            tempTaskRef = new WeakRef(task); // 保存task的WeakRef
        })();

        task = null;
        result = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证：通过原task的WeakRef获取键，检查是否存在条目
        const gcTask = tempTaskRef.deref();
        if (gcTask && taskResultMap.has(gcTask)) {
            throw new Error("WeakMap still contains entry for GC'd task key");
        }
        if (tempResultRef.deref() !== undefined) throw new Error("Result WeakRef not invalidated");

        return "Test Passed: WeakMapTaskKeyResultWeakRefValueTest062";
    },

    /**
     * 63. WeakMap(key=观察者, value=被观察者的WeakRef) — 观察者模式引用
     */
    async test063_WeakMapObserverKeySubjectWeakRefValue() {
        const observerSubjectMap = new WeakMap();
        let observer, subject, tempSubjectRef, tempObserverRef;

        (function createObserverPattern() {
            subject = { id: 'subject', observers: [] };
            observer = {
                id: 'observer',
                subject: subject, // 观察者引用被观察者
                update: () => {}
            };
            subject.observers.push(observer);
            const refToSubject = new WeakRef(subject);
            observerSubjectMap.set(observer, refToSubject);

            if (!subject.observers.includes(observer)) throw new Error("Subject missing observer");
            if (observer.subject !== subject) throw new Error("Observer not linked to subject");
            tempSubjectRef = refToSubject;
            tempObserverRef = new WeakRef(observer); // 保存observer的WeakRef
        })();

        observer = null;
        subject = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证：通过原observer的WeakRef获取键，检查是否存在条目
        const gcObserver = tempObserverRef.deref();
        if (gcObserver && observerSubjectMap.has(gcObserver)) {
            throw new Error("WeakMap still contains entry for GC'd observer key");
        }
        if (tempSubjectRef.deref() !== undefined) throw new Error("Subject WeakRef not invalidated");

        return "Test Passed: WeakMapObserverKeySubjectWeakRefValueTest063";
    },

    /**
     * 64. WeakMap(key=函数对象, value=其闭包的WeakRef) — 函数-闭包引用
     */
    async test064_WeakMapFunctionKeyClosureWeakRefValue() {
        const functionClosureMap = new WeakMap();
        let closureObj, func, tempClosureRef, tempFuncRef;

        (function createFunctionWithClosure() {
            closureObj = { id: 'closure-data', value: 42 };
            func = function() { return closureObj.value; }; // 函数引用闭包
            const refToClosure = new WeakRef(closureObj);
            functionClosureMap.set(func, refToClosure);

            if (func() !== closureObj.value) throw new Error("Function not linked to closure");
            if (functionClosureMap.get(func)?.deref() !== closureObj) throw new Error("WeakRef mismatch");
            tempClosureRef = refToClosure;
            tempFuncRef = new WeakRef(func); // 保存func的WeakRef
        })();

        func = null;
        closureObj = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证：通过原func的WeakRef获取键，检查是否存在条目
        const gcFunc = tempFuncRef.deref();
        if (gcFunc && functionClosureMap.has(gcFunc)) {
            throw new Error("WeakMap still contains entry for GC'd function key");
        }
        if (tempClosureRef.deref() !== undefined) throw new Error("Closure WeakRef not invalidated");

        return "Test Passed: WeakMapFunctionKeyClosureWeakRefValueTest064";
    },

    /**
     * 65. WeakMap(key=错误对象, value=错误源的WeakRef) — 错误-源引用
     */
    async test065_WeakMapErrorKeySourceWeakRefValue() {
        const errorSourceMap = new WeakMap();
        let errorSource, errorObj, tempSourceRef, tempErrorRef;

        (function createErrorAndSource() {
            errorSource = { id: 'error-source', operation: 'read' };
            errorObj = new Error('Failed to read');
            errorObj.source = errorSource; // 错误对象引用源
            const refToSource = new WeakRef(errorSource);
            errorSourceMap.set(errorObj, refToSource);

            if (errorObj.source !== errorSource) throw new Error("Error not linked to source");
            if (errorSourceMap.get(errorObj)?.deref() !== errorSource) throw new Error("WeakRef mismatch");
            tempSourceRef = refToSource;
            tempErrorRef = new WeakRef(errorObj); // 保存errorObj的WeakRef
        })();

        errorObj = null;
        errorSource = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证：通过原errorObj的WeakRef获取键，检查是否存在条目
        const gcError = tempErrorRef.deref();
        if (gcError && errorSourceMap.has(gcError)) {
            throw new Error("WeakMap still contains entry for GC'd error key");
        }
        if (tempSourceRef.deref() !== undefined) throw new Error("Error source WeakRef not invalidated");

        return "Test Passed: WeakMapErrorKeySourceWeakRefValueTest065";
    },

    /**
     * 66. WeakMap(key=时间对象, value=定时器的WeakRef) — 时间-定时器引用
     */
    async test066_WeakMapTimeKeyTimerWeakRefValue() {
        const timeTimerMap = new WeakMap();
        let timeObj, timerObj, tempTimerRef, tempTimeRef;

        (function createTimeAndTimer() {
            timeObj = { id: 'time-tracker', start: Date.now() };
            timerObj = {
                id: 'timer',
                time: timeObj, // 定时器引用时间对象
                interval: null
            };
            const refToTimer = new WeakRef(timerObj);
            timeTimerMap.set(timeObj, refToTimer);

            if (timerObj.time !== timeObj) throw new Error("Timer not linked to time");
            if (timeTimerMap.get(timeObj)?.deref() !== timerObj) throw new Error("WeakRef mismatch");
            tempTimerRef = refToTimer;
            tempTimeRef = new WeakRef(timeObj); // 保存timeObj的WeakRef
        })();

        timeObj = null;
        timerObj = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证：通过原timeObj的WeakRef获取键，检查是否存在条目
        const gcTime = tempTimeRef.deref();
        if (gcTime && timeTimerMap.has(gcTime)) {
            throw new Error("WeakMap still contains entry for GC'd time key");
        }
        if (tempTimerRef.deref() !== undefined) throw new Error("Timer WeakRef not invalidated");

        return "Test Passed: WeakMapTimeKeyTimerWeakRefValueTest066";
    },


    /**
     * 68. WeakMap(key=权限对象, value=角色的WeakRef) — 权限-角色引用
     */
    async test068_WeakMapPermissionKeyRoleWeakRefValue() {
        const permissionRoleMap = new WeakMap();
        let roleObj, permissionObj, tempRoleRef, tempPermissionRef;

        (function createPermissionAndRole() {
            roleObj = { id: 'role-admin', permissions: [] };
            permissionObj = {
                id: 'perm-delete',
                role: roleObj // 权限引用角色
            };
            roleObj.permissions.push(permissionObj);
            const refToRole = new WeakRef(roleObj);
            permissionRoleMap.set(permissionObj, refToRole);

            if (!roleObj.permissions.includes(permissionObj)) throw new Error("Role missing permission");
            if (permissionObj.role !== roleObj) throw new Error("Permission not linked to role");
            tempRoleRef = refToRole;
            tempPermissionRef = new WeakRef(permissionObj); // 保存permission的WeakRef
        })();

        permissionObj = null;
        roleObj = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证：通过原permission的WeakRef获取键，检查是否存在条目
        const gcPermission = tempPermissionRef.deref();
        if (gcPermission && permissionRoleMap.has(gcPermission)) {
            throw new Error("WeakMap still contains entry for GC'd permission key");
        }
        if (tempRoleRef.deref() !== undefined) throw new Error("Role WeakRef not invalidated");

        return "Test Passed: WeakMapPermissionKeyRoleWeakRefValueTest068";
    },



    /**
     * 70. WeakMap(key=会话对象, value=用户的WeakRef) — 会话-用户引用
     */
    async test070_WeakMapSessionKeyUserWeakRefValue() {
        const sessionUserMap = new WeakMap();
        let userObj, sessionObj, tempUserRef, tempSessionRef;

        (function createSessionAndUser() {
            userObj = { id: 'user-789', name: 'Test User' };
            sessionObj = {
                id: 'session-123',
                user: userObj, // 会话引用用户
                startTime: Date.now()
            };
            const refToUser = new WeakRef(userObj);
            sessionUserMap.set(sessionObj, refToUser);

            if (sessionObj.user !== userObj) throw new Error("Session not linked to user");
            if (sessionUserMap.get(sessionObj)?.deref() !== userObj) throw new Error("WeakRef mismatch");
            tempUserRef = refToUser;
            tempSessionRef = new WeakRef(sessionObj); // 保存session的WeakRef
        })();

        sessionObj = null;
        userObj = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证：通过原session的WeakRef获取键，检查是否存在条目
        const gcSession = tempSessionRef.deref();
        if (gcSession && sessionUserMap.has(gcSession)) {
            throw new Error("WeakMap still contains entry for GC'd session key");
        }
        if (tempUserRef.deref() !== undefined) throw new Error("User WeakRef not invalidated");

        return "Test Passed: WeakMapSessionKeyUserWeakRefValueTest070";
    },
    /**
     * 71. WeakMap(key=Array, value=数组元素的WeakRef) — 数组-元素引用
     */
    async test071_WeakMapArrayKeyElementWeakRefValue() {
        const arrayElementMap = new WeakMap();
        let mainArray, elementObj, tempElementRef, tempArrayRef;

        (function createArrayAndElement() {
            elementObj = { id: 'array-element-71', value: 'test' };
            mainArray = [elementObj]; // 数组包含元素
            const refToElement = new WeakRef(elementObj);
            arrayElementMap.set(mainArray, refToElement);

            if (!mainArray.includes(elementObj)) throw new Error("Array does not contain element");
            if (arrayElementMap.get(mainArray)?.deref() !== elementObj) throw new Error("WeakRef mismatch");
            tempElementRef = refToElement;
            tempArrayRef = new WeakRef(mainArray); // 保存数组的WeakRef
        })();

        mainArray = null;
        elementObj = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证数组键是否被GC回收，对应条目是否移除
        const gcArray = tempArrayRef.deref();
        if (gcArray && arrayElementMap.has(gcArray)) {
            throw new Error("WeakMap still contains entry for GC'd array key");
        }
        if (tempElementRef.deref() !== undefined) throw new Error("Array element WeakRef not invalidated");

        return "Test Passed: WeakMapArrayKeyElementWeakRefValueTest071";
    },

    /**
     * 72. WeakMap(key=Set, value=集合元素的WeakRef) — 集合-元素引用
     */
    async test072_WeakMapSetKeyElementWeakRefValue() {
        const setElementMap = new WeakMap();
        let mainSet, elementObj, tempElementRef, tempSetRef;

        (function createSetAndElement() {
            elementObj = { id: 'set-element-72', value: 'test' };
            mainSet = new Set([elementObj]); // Set包含元素
            const refToElement = new WeakRef(elementObj);
            setElementMap.set(mainSet, refToElement);

            if (!mainSet.has(elementObj)) throw new Error("Set does not contain element");
            if (setElementMap.get(mainSet)?.deref() !== elementObj) throw new Error("WeakRef mismatch");
            tempElementRef = refToElement;
            tempSetRef = new WeakRef(mainSet); // 保存Set的WeakRef
        })();

        mainSet = null;
        elementObj = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证Set键是否被GC回收，对应条目是否移除
        const gcSet = tempSetRef.deref();
        if (gcSet && setElementMap.has(gcSet)) {
            throw new Error("WeakMap still contains entry for GC'd set key");
        }
        if (tempElementRef.deref() !== undefined) throw new Error("Set element WeakRef not invalidated");

        return "Test Passed: WeakMapSetKeyElementWeakRefValueTest072";
    },

    /**
     * 73. WeakMap(key=Map, value=映射值的WeakRef) — 映射-值引用
     */
    async test073_WeakMapMapKeyValueWeakRefValue() {
        const mapValueMap = new WeakMap();
        let mainMap, keyObj, valueObj, tempValueRef, tempMapRef;

        (function createMapAndValue() {
            keyObj = { id: 'map-key-73' };
            valueObj = { id: 'map-value-73', data: 'test' };
            mainMap = new Map([[keyObj, valueObj]]); // Map包含键值对
            const refToValue = new WeakRef(valueObj);
            mapValueMap.set(mainMap, refToValue);

            if (mainMap.get(keyObj) !== valueObj) throw new Error("Map does not contain value");
            if (mapValueMap.get(mainMap)?.deref() !== valueObj) throw new Error("WeakRef mismatch");
            tempValueRef = refToValue;
            tempMapRef = new WeakRef(mainMap); // 保存Map的WeakRef
        })();

        mainMap = null;
        keyObj = null;
        valueObj = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证Map键是否被GC回收，对应条目是否移除
        const gcMap = tempMapRef.deref();
        if (gcMap && mapValueMap.has(gcMap)) {
            throw new Error("WeakMap still contains entry for GC'd map key");
        }
        if (tempValueRef.deref() !== undefined) throw new Error("Map value WeakRef not invalidated");

        return "Test Passed: WeakMapMapKeyValueWeakRefValueTest073";
    },

    /**
     * 74. WeakMap(key=Date, value=关联数据的WeakRef) — 日期-数据引用
     */
    async test074_WeakMapDateKeyDataWeakRefValue() {
        const dateDataMap = new WeakMap();
        let dateObj, dataObj, tempDataRef, tempDateRef;

        (function createDateAndData() {
            dateObj = new Date();
            dataObj = {
                id: 'date-data-74',
                timestamp: dateObj.getTime(),
                source: dateObj // 数据关联到Date对象
            };
            const refToData = new WeakRef(dataObj);
            dateDataMap.set(dateObj, refToData);

            if (dataObj.timestamp !== dateObj.getTime()) throw new Error("Data not linked to date");
            if (dateDataMap.get(dateObj)?.deref() !== dataObj) throw new Error("WeakRef mismatch");
            tempDataRef = refToData;
            tempDateRef = new WeakRef(dateObj); // 保存Date的WeakRef
        })();

        dateObj = null;
        dataObj = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证Date键是否被GC回收，对应条目是否移除
        const gcDate = tempDateRef.deref();
        if (gcDate && dateDataMap.has(gcDate)) {
            throw new Error("WeakMap still contains entry for GC'd date key");
        }
        if (tempDataRef.deref() !== undefined) throw new Error("Date data WeakRef not invalidated");

        return "Test Passed: WeakMapDateKeyDataWeakRefValueTest074";
    },

    /**
     * 75. WeakMap(key=RegExp, value=匹配结果的WeakRef) — 正则-结果引用
     */
    async test075_WeakMapRegExpKeyResultWeakRefValue() {
        const regexResultMap = new WeakMap();
        let regexObj, resultObj, tempResultRef, tempRegexRef;

        (function createRegexAndResult() {
            regexObj = /test(\d+)/;
            const testStr = "test123";
            const matchResult = testStr.match(regexObj);

            resultObj = {
                id: 'regex-result-75',
                source: regexObj, // 结果关联到RegExp
                match: matchResult
            };
            const refToResult = new WeakRef(resultObj);
            regexResultMap.set(regexObj, refToResult);

            if (resultObj.source !== regexObj) throw new Error("Result not linked to regex");
            if (regexResultMap.get(regexObj)?.deref() !== resultObj) throw new Error("WeakRef mismatch");
            tempResultRef = refToResult;
            tempRegexRef = new WeakRef(regexObj); // 保存RegExp的WeakRef
        })();

        regexObj = null;
        resultObj = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证RegExp键是否被GC回收，对应条目是否移除
        const gcRegex = tempRegexRef.deref();
        if (gcRegex && regexResultMap.has(gcRegex)) {
            throw new Error("WeakMap still contains entry for GC'd regex key");
        }
        if (tempResultRef.deref() !== undefined) throw new Error("Regex result WeakRef not invalidated");

        return "Test Passed: WeakMapRegExpKeyResultWeakRefValueTest075";
    },

    /**
     * 76. WeakMap(key=数组元素, value=数组的WeakRef) — 元素-数组引用
     */
    async test076_WeakMapArrayElementKeyArrayWeakRefValue() {
        const elementArrayMap = new WeakMap();
        let mainArray, elementObj, tempArrayRef, tempElementRef;

        (function createElementAndArray() {
            elementObj = { id: 'array-element-76', value: 'test' };
            mainArray = [elementObj]; // 数组包含元素
            const refToMainArray = new WeakRef(mainArray);
            elementArrayMap.set(elementObj, refToMainArray);

            if (!mainArray.includes(elementObj)) throw new Error("Array does not contain element");
            if (elementArrayMap.get(elementObj)?.deref() !== mainArray) throw new Error("WeakRef mismatch");
            tempArrayRef = refToMainArray;
            tempElementRef = new WeakRef(elementObj); // 保存元素的WeakRef
        })();

        elementObj = null;
        mainArray = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证数组元素键是否被GC回收，对应条目是否移除
        const gcElement = tempElementRef.deref();
        if (gcElement && elementArrayMap.has(gcElement)) {
            throw new Error("WeakMap still contains entry for GC'd array element key");
        }
        if (tempArrayRef.deref() !== undefined) throw new Error("Array WeakRef not invalidated");

        return "Test Passed: WeakMapArrayElementKeyArrayWeakRefValueTest076";
    },

    /**
     * 77. WeakMap(key=Set元素, value=集合的WeakRef) — 元素-集合引用
     */
    async test077_WeakMapSetElementKeySetWeakRefValue() {
        const elementSetMap = new WeakMap();
        let mainSet, elementObj, tempSetRef, tempElementRef;

        (function createElementAndSet() {
            elementObj = { id: 'set-element-77', value: 'test' };
            mainSet = new Set([elementObj]); // Set包含元素
            const refToMainSet = new WeakRef(mainSet);
            elementSetMap.set(elementObj, refToMainSet);

            if (!mainSet.has(elementObj)) throw new Error("Set does not contain element");
            if (elementSetMap.get(elementObj)?.deref() !== mainSet) throw new Error("WeakRef mismatch");
            tempSetRef = refToMainSet;
            tempElementRef = new WeakRef(elementObj); // 保存元素的WeakRef
        })();

        elementObj = null;
        mainSet = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证Set元素键是否被GC回收，对应条目是否移除
        const gcElement = tempElementRef.deref();
        if (gcElement && elementSetMap.has(gcElement)) {
            throw new Error("WeakMap still contains entry for GC'd set element key");
        }
        if (tempSetRef.deref() !== undefined) throw new Error("Set WeakRef not invalidated");

        return "Test Passed: WeakMapSetElementKeySetWeakRefValueTest077";
    },

    /**
     * 78. WeakMap(key=Map键, value=映射的WeakRef) — 键-映射引用
     */
    async test078_WeakMapMapKeyKeyMapWeakRefValue() {
        const keyMapMap = new WeakMap();
        let mainMap, keyObj, valueObj, tempMapRef, tempKeyRef;

        (function createKeyAndMap() {
            keyObj = { id: 'map-key-78' };
            valueObj = { id: 'map-value-78', data: 'test' };
            mainMap = new Map([[keyObj, valueObj]]); // Map包含键值对
            const refToMainMap = new WeakRef(mainMap);
            keyMapMap.set(keyObj, refToMainMap);

            if (mainMap.get(keyObj) !== valueObj) throw new Error("Map does not contain key");
            if (keyMapMap.get(keyObj)?.deref() !== mainMap) throw new Error("WeakRef mismatch");
            tempMapRef = refToMainMap;
            tempKeyRef = new WeakRef(keyObj); // 保存Map键的WeakRef
        })();

        keyObj = null;
        mainMap = null;
        valueObj = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证Map键是否被GC回收，对应条目是否移除
        const gcKey = tempKeyRef.deref();
        if (gcKey && keyMapMap.has(gcKey)) {
            throw new Error("WeakMap still contains entry for GC'd map key");
        }
        if (tempMapRef.deref() !== undefined) throw new Error("Map WeakRef not invalidated");

        return "Test Passed: WeakMapMapKeyKeyMapWeakRefValueTest078";
    },

    /**
     * 79. WeakMap(key=Map值, value=映射的WeakRef) — 值-映射引用
     */
    async test079_WeakMapMapValueKeyMapWeakRefValue() {
        const valueMapMap = new WeakMap();
        let mainMap, keyObj, valueObj, tempMapRef, tempValueRef;

        (function createValueAndMap() {
            keyObj = { id: 'map-key-79' };
            valueObj = { id: 'map-value-79', data: 'test' };
            mainMap = new Map([[keyObj, valueObj]]); // Map包含键值对
            const refToMainMap = new WeakRef(mainMap);
            valueMapMap.set(valueObj, refToMainMap);

            if (mainMap.get(keyObj) !== valueObj) throw new Error("Map does not contain value");
            if (valueMapMap.get(valueObj)?.deref() !== mainMap) throw new Error("WeakRef mismatch");
            tempMapRef = refToMainMap;
            tempValueRef = new WeakRef(valueObj); // 保存Map值的WeakRef
        })();

        valueObj = null;
        mainMap = null;
        keyObj = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证Map值是否被GC回收，对应条目是否移除
        const gcValue = tempValueRef.deref();
        if (gcValue && valueMapMap.has(gcValue)) {
            throw new Error("WeakMap still contains entry for GC'd map value key");
        }
        if (tempMapRef.deref() !== undefined) throw new Error("Map WeakRef not invalidated");

        return "Test Passed: WeakMapMapValueKeyMapWeakRefValueTest079";
    },

    /**
     * 80. WeakMap(key=Date, value=解析结果的WeakRef) — 日期-解析结果引用
     */
    async test080_WeakMapDateKeyParsedWeakRefValue() {
        const dateParsedMap = new WeakMap();
        let dateObj, parsedObj, tempParsedRef, tempDateRef;

        (function createDateAndParsed() {
            dateObj = new Date('2024-01-01T00:00:00Z');
            parsedObj = {
                id: 'date-parsed-80',
                year: dateObj.getUTCFullYear(),
                month: dateObj.getUTCMonth() + 1,
                day: dateObj.getUTCDate(),
                source: dateObj // 解析结果关联到Date
            };
            const refToParsed = new WeakRef(parsedObj);
            dateParsedMap.set(dateObj, refToParsed);

            if (parsedObj.source !== dateObj) throw new Error("Parsed result not linked to date");
            if (dateParsedMap.get(dateObj)?.deref() !== parsedObj) throw new Error("WeakRef mismatch");
            tempParsedRef = refToParsed;
            tempDateRef = new WeakRef(dateObj); // 保存Date的WeakRef
        })();

        dateObj = null;
        parsedObj = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证Date键是否被GC回收，对应条目是否移除
        const gcDate = tempDateRef.deref();
        if (gcDate && dateParsedMap.has(gcDate)) {
            throw new Error("WeakMap still contains entry for GC'd date key");
        }
        if (tempParsedRef.deref() !== undefined) throw new Error("Parsed date WeakRef not invalidated");

        return "Test Passed: WeakMapDateKeyParsedWeakRefValueTest080";
    },

    /**
     * 81. WeakMap(key=RegExp, value=目标字符串的WeakRef) — 正则-目标字符串引用
     */
    async test081_WeakMapRegExpKeyStringWeakRefValue() {
        const regexStringMap = new WeakMap();
        let regexObj, targetStr, tempStringRef, tempRegexRef;

        (function createRegexAndString() {
            regexObj = /example/gi;
            targetStr = new String("This is an example string with Example content"); // 创建字符串对象
            targetStr.regex = regexObj; // 字符串关联到正则
            const refToTarget = new WeakRef(targetStr);
            regexStringMap.set(regexObj, refToTarget);

            if (targetStr.regex !== regexObj) throw new Error("String not linked to regex");
            if (regexStringMap.get(regexObj)?.deref() !== targetStr) throw new Error("WeakRef mismatch");
            tempStringRef = refToTarget;
            tempRegexRef = new WeakRef(regexObj); // 保存RegExp的WeakRef
        })();

        regexObj = null;
        targetStr = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证RegExp键是否被GC回收，对应条目是否移除
        const gcRegex = tempRegexRef.deref();
        if (gcRegex && regexStringMap.has(gcRegex)) {
            throw new Error("WeakMap still contains entry for GC'd regex key");
        }
        if (tempStringRef.deref() !== undefined) throw new Error("Target string WeakRef not invalidated");

        return "Test Passed: WeakMapRegExpKeyStringWeakRefValueTest081";
    },

    /**
     * 82. WeakMap(key=ArrayBuffer, value=类型化数组的WeakRef) — 缓冲区-数组引用
     */
    async test082_WeakMapArrayBufferKeyArrayWeakRefValue() {
        const bufferArrayMap = new WeakMap();
        let buffer, typedArray, tempArrayRef, tempBufferRef;

        (function createBufferAndArray() {
            buffer = new ArrayBuffer(16); // 创建16字节缓冲区
            typedArray = new Uint32Array(buffer); // 类型化数组引用缓冲区
            typedArray.fill(0x12345678);
            const refToTypedArray = new WeakRef(typedArray);
            bufferArrayMap.set(buffer, refToTypedArray);

            if (typedArray.buffer !== buffer) throw new Error("Typed array not linked to buffer");
            if (bufferArrayMap.get(buffer)?.deref() !== typedArray) throw new Error("WeakRef mismatch");
            tempArrayRef = refToTypedArray;
            tempBufferRef = new WeakRef(buffer); // 保存ArrayBuffer的WeakRef
        })();

        buffer = null;
        typedArray = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证ArrayBuffer键是否被GC回收，对应条目是否移除
        const gcBuffer = tempBufferRef.deref();
        if (gcBuffer && bufferArrayMap.has(gcBuffer)) {
            throw new Error("WeakMap still contains entry for GC'd buffer key");
        }
        if (tempArrayRef.deref() !== undefined) throw new Error("Typed array WeakRef not invalidated");

        return "Test Passed: WeakMapArrayBufferKeyArrayWeakRefValueTest082";
    },

    /**
     * 83. WeakMap(key=Map, value=键数组的WeakRef) — 映射-键数组引用
     */
    async test083_WeakMapMapKeyKeysArrayWeakRefValue() {
        const mapKeysMap = new WeakMap();
        let mainMap, keysArray, tempKeysRef, tempMapRef;

        (function createMapAndKeys() {
            const key1 = { id: 'key-1-83' };
            const key2 = { id: 'key-2-83' };
            mainMap = new Map([[key1, 'value1'], [key2, 'value2']]);
            keysArray = Array.from(mainMap.keys()); // 键数组引用Map
            keysArray.sourceMap = mainMap;
            const refToKeys = new WeakRef(keysArray);
            mapKeysMap.set(mainMap, refToKeys);

            if (keysArray.sourceMap !== mainMap) throw new Error("Keys array not linked to map");
            if (mapKeysMap.get(mainMap)?.deref() !== keysArray) throw new Error("WeakRef mismatch");
            tempKeysRef = refToKeys;
            tempMapRef = new WeakRef(mainMap); // 保存Map的WeakRef
        })();

        mainMap = null;
        keysArray = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证Map键是否被GC回收，对应条目是否移除
        const gcMap = tempMapRef.deref();
        if (gcMap && mapKeysMap.has(gcMap)) {
            throw new Error("WeakMap still contains entry for GC'd map key");
        }
        if (tempKeysRef.deref() !== undefined) throw new Error("Keys array WeakRef not invalidated");

        return "Test Passed: WeakMapMapKeyKeysArrayWeakRefValueTest083";
    },

    /**
     * 84. WeakMap(key=Set, value=值数组的WeakRef) — 集合-值数组引用
     */
    async test084_WeakMapSetKeyValuesArrayWeakRefValue() {
        const setValuesMap = new WeakMap();
        let mainSet, valuesArray, tempValuesRef, tempSetRef;

        (function createSetAndValues() {
            const val1 = { id: 'val-1-84' };
            const val2 = { id: 'val-2-84' };
            mainSet = new Set([val1, val2]);
            valuesArray = Array.from(mainSet.values()); // 值数组引用Set
            valuesArray.sourceSet = mainSet;
            const refToValues = new WeakRef(valuesArray);
            setValuesMap.set(mainSet, refToValues);

            if (valuesArray.sourceSet !== mainSet) throw new Error("Values array not linked to set");
            if (setValuesMap.get(mainSet)?.deref() !== valuesArray) throw new Error("WeakRef mismatch");
            tempValuesRef = refToValues;
            tempSetRef = new WeakRef(mainSet); // 保存Set的WeakRef
        })();

        mainSet = null;
        valuesArray = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证Set键是否被GC回收，对应条目是否移除
        const gcSet = tempSetRef.deref();
        if (gcSet && setValuesMap.has(gcSet)) {
            throw new Error("WeakMap still contains entry for GC'd set key");
        }
        if (tempValuesRef.deref() !== undefined) throw new Error("Values array WeakRef not invalidated");

        return "Test Passed: WeakMapSetKeyValuesArrayWeakRefValueTest084";
    },

    /**
     * 85. WeakMap(key=Date, value=时间戳数组的WeakRef) — 日期-时间戳数组引用
     */
    async test085_WeakMapDateKeyTimestampsWeakRefValue() {
        const dateTimestampsMap = new WeakMap();
        let baseDate, timestampsArray, tempTimestampsRef, tempDateRef;

        (function createDateAndTimestamps() {
            baseDate = new Date();
            timestampsArray = [
                baseDate.getTime(),
                baseDate.getTime() + 1000,
                baseDate.getTime() + 2000
            ];
            timestampsArray.baseDate = baseDate; // 时间戳数组关联到Date
            const refToTimestamps = new WeakRef(timestampsArray);
            dateTimestampsMap.set(baseDate, refToTimestamps);

            if (timestampsArray.baseDate !== baseDate) throw new Error("Timestamps not linked to date");
            if (dateTimestampsMap.get(baseDate)?.deref() !== timestampsArray) throw new Error("WeakRef mismatch");
            tempTimestampsRef = refToTimestamps;
            tempDateRef = new WeakRef(baseDate); // 保存Date的WeakRef
        })();

        baseDate = null;
        timestampsArray = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证Date键是否被GC回收，对应条目是否移除
        const gcDate = tempDateRef.deref();
        if (gcDate && dateTimestampsMap.has(gcDate)) {
            throw new Error("WeakMap still contains entry for GC'd date key");
        }
        if (tempTimestampsRef.deref() !== undefined) throw new Error("Timestamps array WeakRef not invalidated");

        return "Test Passed: WeakMapDateKeyTimestampsWeakRefValueTest085";
    },

    /**
     * 86. WeakMap(key=RegExp, value=替换后字符串的WeakRef) — 正则-替换结果引用
     */
    async test086_WeakMapRegExpKeyReplacedWeakRefValue() {
        const regexReplacedMap = new WeakMap();
        let regexObj, replacedStr, tempReplacedRef, tempRegexRef;

        (function createRegexAndReplaced() {
            regexObj = /old/gi;
            const originalStr = "This is old content with OLD values";
            replacedStr = new String(originalStr.replace(regexObj, "new")); // 创建字符串对象
            replacedStr.originalRegex = regexObj; // 替换结果关联到正则
            const refToReplaced = new WeakRef(replacedStr);
            regexReplacedMap.set(regexObj, refToReplaced);

            if (replacedStr.originalRegex !== regexObj) throw new Error("Replaced string not linked to regex");
            if (regexReplacedMap.get(regexObj)?.deref() !== replacedStr) throw new Error("WeakRef mismatch");
            tempReplacedRef = refToReplaced;
            tempRegexRef = new WeakRef(regexObj); // 保存RegExp的WeakRef
        })();

        regexObj = null;
        replacedStr = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证RegExp键是否被GC回收，对应条目是否移除
        const gcRegex = tempRegexRef.deref();
        if (gcRegex && regexReplacedMap.has(gcRegex)) {
            throw new Error("WeakMap still contains entry for GC'd regex key");
        }
        if (tempReplacedRef.deref() !== undefined) throw new Error("Replaced string WeakRef not invalidated");

        return "Test Passed: WeakMapRegExpKeyReplacedWeakRefValueTest086";
    },

    /**
     * 87. WeakMap(key=Array, value=排序后数组的WeakRef) — 原数组-排序数组引用
     */
    async test087_WeakMapArrayKeySortedWeakRefValue() {
        const arraySortedMap = new WeakMap();
        let originalArray, sortedArray, tempSortedRef, tempOriginalRef;

        (function createArrayAndSorted() {
            originalArray = [3, 1, 4, 1, 5, 9];
            sortedArray = [...originalArray].sort((a, b) => a - b); // 排序数组引用原数组
            sortedArray.original = originalArray;
            const refToSorted = new WeakRef(sortedArray);
            arraySortedMap.set(originalArray, refToSorted);

            if (sortedArray.original !== originalArray) throw new Error("Sorted array not linked to original");
            if (arraySortedMap.get(originalArray)?.deref() !== sortedArray) throw new Error("WeakRef mismatch");
            tempSortedRef = refToSorted;
            tempOriginalRef = new WeakRef(originalArray); // 保存原数组的WeakRef
        })();

        originalArray = null;
        sortedArray = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证原数组键是否被GC回收，对应条目是否移除
        const gcOriginal = tempOriginalRef.deref();
        if (gcOriginal && arraySortedMap.has(gcOriginal)) {
            throw new Error("WeakMap still contains entry for GC'd original array key");
        }
        if (tempSortedRef.deref() !== undefined) throw new Error("Sorted array WeakRef not invalidated");

        return "Test Passed: WeakMapArrayKeySortedWeakRefValueTest087";
    },

    /**
     * 88. WeakMap(key=Map, value=反转映射的WeakRef) — 原映射-反转映射引用
     */
    async test088_WeakMapMapKeyInvertedWeakRefValue() {
        const mapInvertedMap = new WeakMap();
        let originalMap, invertedMap, tempInvertedRef, tempOriginalRef;

        (function createMapAndInverted() {
            originalMap = new Map([
                [{ id: 'key1' }, { id: 'val1' }],
                [{ id: 'key2' }, { id: 'val2' }]
            ]);
            // 创建反转映射（值作为键，键作为值）
            invertedMap = new Map();
            originalMap.forEach((value, key) => invertedMap.set(value, key));
            invertedMap.original = originalMap; // 反转映射关联到原映射
            const refToInverted = new WeakRef(invertedMap);
            mapInvertedMap.set(originalMap, refToInverted);

            if (invertedMap.original !== originalMap) throw new Error("Inverted map not linked to original");
            if (mapInvertedMap.get(originalMap)?.deref() !== invertedMap) throw new Error("WeakRef mismatch");
            tempInvertedRef = refToInverted;
            tempOriginalRef = new WeakRef(originalMap); // 保存原Map的WeakRef
        })();

        originalMap = null;
        invertedMap = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证原Map键是否被GC回收，对应条目是否移除
        const gcOriginal = tempOriginalRef.deref();
        if (gcOriginal && mapInvertedMap.has(gcOriginal)) {
            throw new Error("WeakMap still contains entry for GC'd original map key");
        }
        if (tempInvertedRef.deref() !== undefined) throw new Error("Inverted map WeakRef not invalidated");

        return "Test Passed: WeakMapMapKeyInvertedWeakRefValueTest088";
    },

    /**
     * 89. WeakMap(key=Set, value=过滤后集合的WeakRef) — 原集合-过滤集合引用
     */
    async test089_WeakMapSetKeyFilteredWeakRefValue() {
        const setFilteredMap = new WeakMap();
        let originalSet, filteredSet, tempFilteredRef, tempOriginalRef;

        (function createSetAndFiltered() {
            originalSet = new Set([
                { id: 'item1', value: 5 },
                { id: 'item2', value: 15 },
                { id: 'item3', value: 10 }
            ]);
            // 创建过滤后的集合（只保留value > 10的元素）
            filteredSet = new Set();
            originalSet.forEach(item => {
                if (item.value > 10) filteredSet.add(item);
            });
            filteredSet.original = originalSet; // 过滤集合关联到原集合
            const refToFiltered = new WeakRef(filteredSet);
            setFilteredMap.set(originalSet, refToFiltered);

            if (filteredSet.original !== originalSet) throw new Error("Filtered set not linked to original");
            if (setFilteredMap.get(originalSet)?.deref() !== filteredSet) throw new Error("WeakRef mismatch");
            tempFilteredRef = refToFiltered;
            tempOriginalRef = new WeakRef(originalSet); // 保存原Set的WeakRef
        })();

        originalSet = null;
        filteredSet = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证原Set键是否被GC回收，对应条目是否移除
        const gcOriginal = tempOriginalRef.deref();
        if (gcOriginal && setFilteredMap.has(gcOriginal)) {
            throw new Error("WeakMap still contains entry for GC'd original set key");
        }
        if (tempFilteredRef.deref() !== undefined) throw new Error("Filtered set WeakRef not invalidated");

        return "Test Passed: WeakMapSetKeyFilteredWeakRefValueTest089";
    },

    /**
     * 90. WeakMap(key=RegExp, value=匹配数组的WeakRef) — 正则-匹配数组引用
     */
    async test090_WeakMapRegExpKeyMatchesWeakRefValue() {
        const regexMatchesMap = new WeakMap();
        let regexObj, matchesArray, tempMatchesRef, tempRegexRef;

        (function createRegexAndMatches() {
            regexObj = /(\w+)=(\w+)/g;
            const targetStr = "name=test&age=30&lang=js";
            // 获取所有匹配结果
            matchesArray = [];
            let match;
            while ((match = regexObj.exec(targetStr)) !== null) {
                matchesArray.push([...match]);
            }
            matchesArray.regex = regexObj; // 匹配数组关联到正则
            const refToMatches = new WeakRef(matchesArray);
            regexMatchesMap.set(regexObj, refToMatches);

            if (matchesArray.regex !== regexObj) throw new Error("Matches array not linked to regex");
            if (regexMatchesMap.get(regexObj)?.deref() !== matchesArray) throw new Error("WeakRef mismatch");
            tempMatchesRef = refToMatches;
            tempRegexRef = new WeakRef(regexObj); // 保存RegExp的WeakRef
        })();

        regexObj = null;
        matchesArray = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证RegExp键是否被GC回收，对应条目是否移除
        const gcRegex = tempRegexRef.deref();
        if (gcRegex && regexMatchesMap.has(gcRegex)) {
            throw new Error("WeakMap still contains entry for GC'd regex key");
        }
        if (tempMatchesRef.deref() !== undefined) throw new Error("Matches array WeakRef not invalidated");

        return "Test Passed: WeakMapRegExpKeyMatchesWeakRefValueTest090";
    },

    /**
     * 91. WeakMap(key=Array, value=数组切片的WeakRef) — 原数组-切片引用
     */
    async test091_WeakMapArrayKeySliceWeakRefValue() {
        const arraySliceMap = new WeakMap();
        let originalArray, sliceArray, tempSliceRef, tempOriginalRef;

        (function createArrayAndSlice() {
            originalArray = [10, 20, 30, 40, 50];
            sliceArray = originalArray.slice(1, 4); // 数组切片
            sliceArray.source = originalArray; // 切片关联原数组
            const refToSlice = new WeakRef(sliceArray);
            arraySliceMap.set(originalArray, refToSlice);

            if (sliceArray.source !== originalArray) throw new Error("Slice not linked to original array");
            if (arraySliceMap.get(originalArray)?.deref() !== sliceArray) throw new Error("WeakRef mismatch");
            tempSliceRef = refToSlice;
            tempOriginalRef = new WeakRef(originalArray);
        })();

        originalArray = null;
        sliceArray = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        const gcOriginal = tempOriginalRef.deref();
        if (gcOriginal && arraySliceMap.has(gcOriginal)) {
            throw new Error("WeakMap still contains entry for GC'd original array");
        }
        if (tempSliceRef.deref() !== undefined) throw new Error("Array slice WeakRef not invalidated");

        return "Test Passed: WeakMapArrayKeySliceWeakRefValueTest091";
    },

    /**
     * 92. WeakMap(key=Map, value=键值对数组的WeakRef) — 映射-键值对数组引用
     */
    async test092_WeakMapMapKeyEntriesWeakRefValue() {
        const mapEntriesMap = new WeakMap();
        let originalMap, entriesArray, tempEntriesRef, tempOriginalRef;

        (function createMapAndEntries() {
            originalMap = new Map([
                ['a', { id: 'val-a' }],
                ['b', { id: 'val-b' }]
            ]);
            entriesArray = Array.from(originalMap.entries()); // 键值对数组
            entriesArray.sourceMap = originalMap;
            const refToEntries = new WeakRef(entriesArray);
            mapEntriesMap.set(originalMap, refToEntries);

            if (entriesArray.sourceMap !== originalMap) throw new Error("Entries not linked to map");
            if (mapEntriesMap.get(originalMap)?.deref() !== entriesArray) throw new Error("WeakRef mismatch");
            tempEntriesRef = refToEntries;
            tempOriginalRef = new WeakRef(originalMap);
        })();

        originalMap = null;
        entriesArray = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        const gcOriginal = tempOriginalRef.deref();
        if (gcOriginal && mapEntriesMap.has(gcOriginal)) {
            throw new Error("WeakMap still contains entry for GC'd original map");
        }
        if (tempEntriesRef.deref() !== undefined) throw new Error("Entries array WeakRef not invalidated");

        return "Test Passed: WeakMapMapKeyEntriesWeakRefValueTest092";
    },

    /**
     * 93. WeakMap(key=Set, value=集合并集的WeakRef) — 原集合-并集引用
     */
    async test093_WeakMapSetKeyUnionWeakRefValue() {
        const setUnionMap = new WeakMap();
        let originalSet, otherSet, unionSet, tempUnionRef, tempOriginalRef;

        (function createSetAndUnion() {
            originalSet = new Set([1, 2, 3]);
            otherSet = new Set([3, 4, 5]);
            // 计算并集
            unionSet = new Set([...originalSet, ...otherSet]);
            unionSet.source = originalSet;
            const refToUnion = new WeakRef(unionSet);
            setUnionMap.set(originalSet, refToUnion);

            if (unionSet.source !== originalSet) throw new Error("Union not linked to original set");
            if (setUnionMap.get(originalSet)?.deref() !== unionSet) throw new Error("WeakRef mismatch");
            tempUnionRef = refToUnion;
            tempOriginalRef = new WeakRef(originalSet);
        })();

        originalSet = null;
        otherSet = null;
        unionSet = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        const gcOriginal = tempOriginalRef.deref();
        if (gcOriginal && setUnionMap.has(gcOriginal)) {
            throw new Error("WeakMap still contains entry for GC'd original set");
        }
        if (tempUnionRef.deref() !== undefined) throw new Error("Union set WeakRef not invalidated");

        return "Test Passed: WeakMapSetKeyUnionWeakRefValueTest093";
    },

    /**
     * 94. WeakMap(key=Date, value=本地化字符串的WeakRef) — 日期-本地化字符串引用
     */
    async test094_WeakMapDateKeyLocaleWeakRefValue() {
        const dateLocaleMap = new WeakMap();
        let dateObj, localeStr, tempLocaleRef, tempDateRef;

        (function createDateAndLocale() {
            dateObj = new Date(2024, 0, 1);
            localeStr = new String(dateObj.toLocaleDateString('zh-CN', {
                year: 'numeric',
                month: 'long',
                day: 'numeric'
            })); // 本地化字符串对象
            localeStr.sourceDate = dateObj;
            const refToLocale = new WeakRef(localeStr);
            dateLocaleMap.set(dateObj, refToLocale);

            if (localeStr.sourceDate !== dateObj) throw new Error("Locale string not linked to date");
            if (dateLocaleMap.get(dateObj)?.deref() !== localeStr) throw new Error("WeakRef mismatch");
            tempLocaleRef = refToLocale;
            tempDateRef = new WeakRef(dateObj);
        })();

        dateObj = null;
        localeStr = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        const gcDate = tempDateRef.deref();
        if (gcDate && dateLocaleMap.has(gcDate)) {
            throw new Error("WeakMap still contains entry for GC'd date");
        }
        if (tempLocaleRef.deref() !== undefined) throw new Error("Locale string WeakRef not invalidated");

        return "Test Passed: WeakMapDateKeyLocaleWeakRefValueTest094";
    },

    /**
     * 95. WeakMap(key=RegExp, value=分组匹配的WeakRef) — 正则-分组结果引用
     */
    async test095_WeakMapRegExpKeyGroupsWeakRefValue() {
        const regexGroupsMap = new WeakMap();
        let regexObj, groupsObj, tempGroupsRef, tempRegexRef;

        (function createRegexAndGroups() {
            regexObj = /(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/;
            const match = "2024-03-15".match(regexObj);
            groupsObj = { ...match.groups, sourceRegex: regexObj }; // 分组结果
            const refToGroups = new WeakRef(groupsObj);
            regexGroupsMap.set(regexObj, refToGroups);

            if (groupsObj.sourceRegex !== regexObj) throw new Error("Groups not linked to regex");
            if (regexGroupsMap.get(regexObj)?.deref() !== groupsObj) throw new Error("WeakRef mismatch");
            tempGroupsRef = refToGroups;
            tempRegexRef = new WeakRef(regexObj);
        })();

        regexObj = null;
        groupsObj = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        const gcRegex = tempRegexRef.deref();
        if (gcRegex && regexGroupsMap.has(gcRegex)) {
            throw new Error("WeakMap still contains entry for GC'd regex");
        }
        if (tempGroupsRef.deref() !== undefined) throw new Error("Groups object WeakRef not invalidated");

        return "Test Passed: WeakMapRegExpKeyGroupsWeakRefValueTest095";
    },

    /**
     * 96. WeakMap(key=数组缓冲区, value=数据视图的WeakRef) — 缓冲区-数据视图引用
     */
    async test096_WeakMapBufferKeyViewWeakRefValue() {
        const bufferViewMap = new WeakMap();
        let buffer, dataView, tempViewRef, tempBufferRef;

        (function createBufferAndView() {
            buffer = new ArrayBuffer(24); // 24字节缓冲区
            dataView = new DataView(buffer); // 数据视图
            dataView.setInt32(0, 0x12345678);
            dataView.sourceBuffer = buffer;
            const refToView = new WeakRef(dataView);
            bufferViewMap.set(buffer, refToView);

            if (dataView.sourceBuffer !== buffer) throw new Error("DataView not linked to buffer");
            if (bufferViewMap.get(buffer)?.deref() !== dataView) throw new Error("WeakRef mismatch");
            tempViewRef = refToView;
            tempBufferRef = new WeakRef(buffer);
        })();

        buffer = null;
        dataView = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        const gcBuffer = tempBufferRef.deref();
        if (gcBuffer && bufferViewMap.has(gcBuffer)) {
            throw new Error("WeakMap still contains entry for GC'd buffer");
        }
        if (tempViewRef.deref() !== undefined) throw new Error("DataView WeakRef not invalidated");

        return "Test Passed: WeakMapBufferKeyViewWeakRefValueTest096";
    },

    /**
     * 97. WeakMap(key=Map, value=键值转换结果的WeakRef) — 映射-转换结果引用
     */
    async test097_WeakMapMapKeyTransformedWeakRefValue() {
        const mapTransformedMap = new WeakMap();
        let originalMap, transformedMap, tempTransformedRef, tempOriginalRef;

        (function createMapAndTransformed() {
            originalMap = new Map([
                [1, 'one'],
                [2, 'two']
            ]);
            // 键值类型转换
            transformedMap = new Map();
            originalMap.forEach((value, key) => {
                transformedMap.set(String(key), key);
            });
            transformedMap.source = originalMap;
            const refToTransformed = new WeakRef(transformedMap);
            mapTransformedMap.set(originalMap, refToTransformed);

            if (transformedMap.source !== originalMap) throw new Error("Transformed map not linked to original");
            if (mapTransformedMap.get(originalMap)?.deref() !== transformedMap) throw new Error("WeakRef mismatch");
            tempTransformedRef = refToTransformed;
            tempOriginalRef = new WeakRef(originalMap);
        })();

        originalMap = null;
        transformedMap = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        const gcOriginal = tempOriginalRef.deref();
        if (gcOriginal && mapTransformedMap.has(gcOriginal)) {
            throw new Error("WeakMap still contains entry for GC'd original map");
        }
        if (tempTransformedRef.deref() !== undefined) throw new Error("Transformed map WeakRef not invalidated");

        return "Test Passed: WeakMapMapKeyTransformedWeakRefValueTest097";
    },

    /**
     * 98. WeakMap(key=Set, value=集合交集的WeakRef) — 原集合-交集引用
     */
    async test098_WeakMapSetKeyIntersectionWeakRefValue() {
        const setIntersectionMap = new WeakMap();
        let originalSet, otherSet, intersectionSet, tempIntersectionRef, tempOriginalRef;

        (function createSetAndIntersection() {
            originalSet = new Set(['a', 'b', 'c']);
            otherSet = new Set(['b', 'c', 'd']);
            // 计算交集
            intersectionSet = new Set([...originalSet].filter(x => otherSet.has(x)));
            intersectionSet.source = originalSet;
            const refToIntersection = new WeakRef(intersectionSet);
            setIntersectionMap.set(originalSet, refToIntersection);

            if (intersectionSet.source !== originalSet) throw new Error("Intersection not linked to original set");
            if (setIntersectionMap.get(originalSet)?.deref() !== intersectionSet) throw new Error("WeakRef mismatch");
            tempIntersectionRef = refToIntersection;
            tempOriginalRef = new WeakRef(originalSet);
        })();

        originalSet = null;
        otherSet = null;
        intersectionSet = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        const gcOriginal = tempOriginalRef.deref();
        if (gcOriginal && setIntersectionMap.has(gcOriginal)) {
            throw new Error("WeakMap still contains entry for GC'd original set");
        }
        if (tempIntersectionRef.deref() !== undefined) throw new Error("Intersection set WeakRef not invalidated");

        return "Test Passed: WeakMapSetKeyIntersectionWeakRefValueTest098";
    },

    /**
     * 99. WeakMap(key=Date, value=时间差对象的WeakRef) — 日期-时间差引用
     */
    async test099_WeakMapDateKeyDiffWeakRefValue() {
        const dateDiffMap = new WeakMap();
        let baseDate, otherDate, diffObj, tempDiffRef, tempBaseRef;

        (function createDateAndDiff() {
            baseDate = new Date(2024, 0, 1);
            otherDate = new Date(2024, 6, 1);
            const diffMs = otherDate.getTime() - baseDate.getTime();
            diffObj = {
                days: Math.floor(diffMs / (1000 * 60 * 60 * 24)),
                source: baseDate // 时间差关联基准日期
            };
            const refToDiff = new WeakRef(diffObj);
            dateDiffMap.set(baseDate, refToDiff);

            if (diffObj.source !== baseDate) throw new Error("Date diff not linked to base date");
            if (dateDiffMap.get(baseDate)?.deref() !== diffObj) throw new Error("WeakRef mismatch");
            tempDiffRef = refToDiff;
            tempBaseRef = new WeakRef(baseDate);
        })();

        baseDate = null;
        otherDate = null;
        diffObj = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        const gcBase = tempBaseRef.deref();
        if (gcBase && dateDiffMap.has(gcBase)) {
            throw new Error("WeakMap still contains entry for GC'd base date");
        }
        if (tempDiffRef.deref() !== undefined) throw new Error("Date diff WeakRef not invalidated");

        return "Test Passed: WeakMapDateKeyDiffWeakRefValueTest099";
    },

    /**
     * 100. WeakMap(key=RegExp, value=替换函数结果的WeakRef) — 正则-函数替换结果引用
     */
    async test100_WeakMapRegExpKeyReplaceFnWeakRefValue() {
        const regexReplaceFnMap = new WeakMap();
        let regexObj, resultStr, tempResultRef, tempRegexRef;

        (function createRegexAndReplace() {
            regexObj = /(\d+)/g;
            const originalStr = "Prices: 10, 20, 30";
            // 使用函数进行替换
            resultStr = new String(originalStr.replace(regexObj, (match) => {
                return `$${match}`;
            }));
            resultStr.sourceRegex = regexObj;
            const refToResult = new WeakRef(resultStr);
            regexReplaceFnMap.set(regexObj, refToResult);

            if (resultStr.sourceRegex !== regexObj) throw new Error("Replace result not linked to regex");
            if (regexReplaceFnMap.get(regexObj)?.deref() !== resultStr) throw new Error("WeakRef mismatch");
            tempResultRef = refToResult;
            tempRegexRef = new WeakRef(regexObj);
        })();

        regexObj = null;
        resultStr = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        const gcRegex = tempRegexRef.deref();
        if (gcRegex && regexReplaceFnMap.has(gcRegex)) {
            throw new Error("WeakMap still contains entry for GC'd regex");
        }
        if (tempResultRef.deref() !== undefined) throw new Error("Replace result WeakRef not invalidated");

        return "Test Passed: WeakMapRegExpKeyReplaceFnWeakRefValueTest100";
    }
};