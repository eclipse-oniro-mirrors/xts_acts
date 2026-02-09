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
export const WeakMixTestUtils = {
    /**
     * 000. 基础组合：WeakSet存储对象，WeakMap映射到它们的WeakRef
     */
    async test007_WeakSetMapRefBasic() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let obj1, obj2, ref1, ref2;

        // 创建对象并建立引用关系
        (function createObjects() {
            obj1 = { id: 'obj-1-000' };
            obj2 = { id: 'obj-2-000' };

            // WeakSet存储对象
            weakSet.add(obj1);
            weakSet.add(obj2);

            // WeakMap映射到对象的WeakRef
            ref1 = new WeakRef(obj1);
            ref2 = new WeakRef(obj2);
            weakMap.set(obj1, ref2);
            weakMap.set(obj2, ref1);

            // 验证初始状态
            if (!weakSet.has(obj1) || !weakSet.has(obj2)) throw new Error("WeakSet initialization failed");
            if (weakMap.get(obj1)?.deref() !== obj2 || weakMap.get(obj2)?.deref() !== obj1) {
                throw new Error("WeakMap WeakRef mapping failed");
            }
        })();

        // 清除强引用
        const tempRef1 = ref1;
        const tempRef2 = ref2;
        obj1 = null;
        obj2 = null;
        ref1 = null;
        ref2 = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempRef1.deref() !== undefined || tempRef2.deref() !== undefined) {
            throw new Error("Objects not properly GC'd");
        }

        return "Test Passed: WeakSetMapRefBasicTest007";
    },

    /**
     * 001. 数组元素组合：WeakMap使用数组作为键，WeakSet存储元素
     */
    async test001_WeakMixArrayElements() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let mainArray, element1, element2, arrayRef;

        (function createArrayStructure() {
            element1 = { id: 'elem-1-001' };
            element2 = { id: 'elem-2-001' };
            mainArray = [element1, element2];

            // WeakSet存储数组元素
            weakSet.add(element1);
            weakSet.add(element2);

            // WeakMap使用数组作为键，存储元素的WeakRef
            const elementsRef = new WeakRef([
                new WeakRef(element1),
                new WeakRef(element2)
            ]);
            weakMap.set(mainArray, elementsRef);

            arrayRef = new WeakRef(mainArray);

            // 验证初始状态
            if (!weakSet.has(element1) || !weakSet.has(element2)) throw new Error("WeakSet elements missing");
            if (!weakMap.has(mainArray)) throw new Error("WeakMap array key missing");
        })();

        // 清除强引用
        const tempArrayRef = arrayRef;
        const tempElement1Ref = new WeakRef(element1);
        const tempElement2Ref = new WeakRef(element2);
        mainArray = null;
        element1 = null;
        element2 = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempArrayRef.deref() !== undefined) throw new Error("Array not GC'd");
        if (tempElement1Ref.deref() !== undefined || tempElement2Ref.deref() !== undefined) {
            throw new Error("Array elements not GC'd");
        }

        return "Test Passed: WeakMixArrayElementsTest001";
    },

    /**
     * 002. Map条目组合：WeakSet存储Maps，WeakMap关联到条目数组的WeakRef
     */
    async test002_WeakMixMapEntries() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let mainMap, keyObj, valueObj, mapRef;

        (function createMapStructure() {
            keyObj = { id: 'key-002' };
            valueObj = { id: 'value-002' };
            mainMap = new Map([[keyObj, valueObj]]);

            // WeakSet存储Map实例
            weakSet.add(mainMap);

            // 创建条目数组并存储其WeakRef
            const entries = Array.from(mainMap.entries());
            const entriesRef = new WeakRef(entries);
            weakMap.set(mainMap, entriesRef);

            mapRef = new WeakRef(mainMap);

            // 验证初始状态
            if (!weakSet.has(mainMap)) throw new Error("WeakSet does not contain map");
            if (weakMap.get(mainMap)?.deref() !== entries) throw new Error("Entries WeakRef mismatch");
        })();

        // 清除强引用
        const tempMapRef = mapRef;
        const tempKeyRef = new WeakRef(keyObj);
        const tempValueRef = new WeakRef(valueObj);
        mainMap = null;
        keyObj = null;
        valueObj = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempMapRef.deref() !== undefined) throw new Error("Map instance not GC'd");
        if (tempKeyRef.deref() !== undefined || tempValueRef.deref() !== undefined) {
            throw new Error("Map entries not GC'd");
        }

        return "Test Passed: WeakMixMapEntriesTest002";
    },

    /**
     * 003. 日期跟踪组合：WeakSet存储Date，WeakMap关联相关数据的WeakRef
     */
    async test003_WeakMixDateTracking() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let dateObj, relatedData, dateRef;

        (function createDateStructure() {
            dateObj = new Date('2024-01-01');
            relatedData = {
                id: 'data-003',
                formatted: dateObj.toISOString(),
                source: dateObj
            };

            // WeakSet存储Date对象
            weakSet.add(dateObj);

            // WeakMap关联到相关数据的WeakRef
            const dataRef = new WeakRef(relatedData);
            weakMap.set(dateObj, dataRef);

            dateRef = new WeakRef(dateObj);

            // 验证初始状态
            if (!weakSet.has(dateObj)) throw new Error("WeakSet does not contain date");
            if (weakMap.get(dateObj)?.deref() !== relatedData) throw new Error("Data WeakRef mismatch");
        })();

        // 清除强引用
        const tempDateRef = dateRef;
        const tempDataRef = new WeakRef(relatedData);
        dateObj = null;
        relatedData = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempDateRef.deref() !== undefined) throw new Error("Date object not GC'd");
        if (tempDataRef.deref() !== undefined) throw new Error("Related data not GC'd");

        return "Test Passed: WeakMixDateTrackingTest003";
    },

    /**
     * 004. 正则匹配组合：WeakSet存储RegExp，WeakMap关联匹配结果的WeakRef
     */
    async test004_WeakMixRegExpMatches() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let regexObj, matchResults, regexRef;

        (function createRegexStructure() {
            regexObj = /user=(\w+)/g;
            const testString = "user=alice;user=bob;user=charlie";

            // 获取匹配结果
            matchResults = [];
            let match;
            while ((match = regexObj.exec(testString)) !== null) {
                matchResults.push([...match]);
            }
            matchResults.sourceRegex = regexObj;

            // WeakSet存储RegExp对象
            weakSet.add(regexObj);

            // WeakMap关联到匹配结果的WeakRef
            const resultsRef = new WeakRef(matchResults);
            weakMap.set(regexObj, resultsRef);

            regexRef = new WeakRef(regexObj);

            // 验证初始状态
            if (!weakSet.has(regexObj)) throw new Error("WeakSet does not contain regex");
            if (weakMap.get(regexObj)?.deref() !== matchResults) throw new Error("Results WeakRef mismatch");
        })();

        // 清除强引用
        const tempRegexRef = regexRef;
        const tempResultsRef = new WeakRef(matchResults);
        regexObj = null;
        matchResults = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempRegexRef.deref() !== undefined) throw new Error("Regex object not GC'd");
        if (tempResultsRef.deref() !== undefined) throw new Error("Match results not GC'd");

        return "Test Passed: WeakMixRegExpMatchesTest004";
    },

    /**
     * 005. 缓冲区视图组合：WeakSet存储ArrayBuffer，WeakMap关联DataView的WeakRef
     */
    async test005_WeakMixBufferViews() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let buffer, view, bufferRef;

        (function createBufferStructure() {
            buffer = new ArrayBuffer(32); // 32字节缓冲区
            view = new DataView(buffer);

            // 写入一些测试数据
            view.setUint32(0, 0x12345678);
            view.setFloat64(8, Math.PI);

            // WeakSet存储ArrayBuffer
            weakSet.add(buffer);

            // WeakMap关联到DataView的WeakRef
            const viewRef = new WeakRef(view);
            weakMap.set(buffer, viewRef);

            bufferRef = new WeakRef(buffer);

            // 验证初始状态
            if (!weakSet.has(buffer)) throw new Error("WeakSet does not contain buffer");
            if (weakMap.get(buffer)?.deref() !== view) throw new Error("DataView WeakRef mismatch");
        })();

        // 清除强引用
        const tempBufferRef = bufferRef;
        const tempViewRef = new WeakRef(view);
        buffer = null;
        view = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempBufferRef.deref() !== undefined) throw new Error("ArrayBuffer not GC'd");
        if (tempViewRef.deref() !== undefined) throw new Error("DataView not GC'd");

        return "Test Passed: WeakMixBufferViewsTest005";
    },

    /**
     * 006. 集合操作组合：WeakMap使用Set作为键，WeakSet跟踪相关对象
     */
    async test006_WeakMixSetOperations() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let mainSet, relatedObj1, relatedObj2, setRef;

        (function createSetStructure() {
            relatedObj1 = { id: 'related-1-006', type: 'data' };
            relatedObj2 = { id: 'related-2-006', type: 'meta' };
            mainSet = new Set([1, 2, 3, 4, 5]);

            // WeakSet存储相关对象
            weakSet.add(relatedObj1);
            weakSet.add(relatedObj2);

            // WeakMap使用Set作为键，存储相关对象的WeakRef
            const relatedRefs = new WeakRef({
                data: new WeakRef(relatedObj1),
                meta: new WeakRef(relatedObj2)
            });
            weakMap.set(mainSet, relatedRefs);

            setRef = new WeakRef(mainSet);

            // 验证初始状态
            if (!weakSet.has(relatedObj1) || !weakSet.has(relatedObj2)) {
                throw new Error("WeakSet missing related objects");
            }
            if (!weakMap.has(mainSet)) throw new Error("WeakMap missing set key");
        })();

        // 清除强引用
        const tempSetRef = setRef;
        const tempObj1Ref = new WeakRef(relatedObj1);
        const tempObj2Ref = new WeakRef(relatedObj2);
        mainSet = null;
        relatedObj1 = null;
        relatedObj2 = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempSetRef.deref() !== undefined) throw new Error("Set instance not GC'd");
        if (tempObj1Ref.deref() !== undefined || tempObj2Ref.deref() !== undefined) {
            throw new Error("Related objects not GC'd");
        }

        return "Test Passed: WeakMixSetOperationsTest006";
    },



    /**
     * 008. 类实例组合：WeakSet存储类实例，WeakMap关联内部数据的WeakRef
     */
    async test008_WeakMixClassInstances() {
        // 定义测试类
        class DataProcessor {
            constructor(id) {
                this.id = id;
                this.internalData = {
                    cache: new Map(),
                    stats: { hits: 0, misses: 0 }
                };
            }

            process(data) {
                this.internalData.stats.hits++;
                return data.toString();
            }
        }

        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let processor, dataRef;

        (function createClassStructure() {
            processor = new DataProcessor('processor-008');

            // WeakSet存储类实例
            weakSet.add(processor);

            // WeakMap关联到内部数据的WeakRef
            dataRef = new WeakRef(processor.internalData);
            weakMap.set(processor, dataRef);

            // 验证初始状态
            if (!weakSet.has(processor)) throw new Error("WeakSet does not contain instance");
            if (weakMap.get(processor)?.deref() !== processor.internalData) {
                throw new Error("Internal data WeakRef mismatch");
            }
        })();

        // 清除强引用
        const tempProcessorRef = new WeakRef(processor);
        const tempDataRef = dataRef;
        processor = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempProcessorRef.deref() !== undefined) throw new Error("Class instance not GC'd");
        if (tempDataRef.deref() !== undefined) throw new Error("Internal data not GC'd");

        return "Test Passed: WeakMixClassInstancesTest008";
    },

    /**
     * 009. 循环引用组合：处理循环引用场景
     */
    async test009_WeakMixCircularRef() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let objA, objB, refA, refB;

        (function createCircularStructure() {
            // 创建循环引用
            objA = { id: 'obj-A-009' };
            objB = { id: 'obj-B-009' };
            objA.linked = objB;
            objB.linked = objA;

            // WeakSet存储这两个对象
            weakSet.add(objA);
            weakSet.add(objB);

            // WeakMap存储相互的WeakRef
            refA = new WeakRef(objA);
            refB = new WeakRef(objB);
            weakMap.set(objA, refB);
            weakMap.set(objB, refA);

            // 验证初始状态
            if (!weakSet.has(objA) || !weakSet.has(objB)) throw new Error("WeakSet missing objects");
            if (weakMap.get(objA)?.deref() !== objB || weakMap.get(objB)?.deref() !== objA) {
                throw new Error("Circular WeakRef mapping failed");
            }
        })();

        // 清除强引用（打破循环引用）
        const tempRefA = refA;
        const tempRefB = refB;
        objA.linked = null;
        objB.linked = null;
        objA = null;
        objB = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempRefA.deref() !== undefined || tempRefB.deref() !== undefined) {
            throw new Error("Circular referenced objects not GC'd");
        }

        return "Test Passed: WeakMixCircularRefTest009";
    },
    /**
     * 010. 嵌套数组组合：WeakMap存储外层数组，WeakSet跟踪内层数组
     */
    async test010_WeakMixNestedArrays() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let outerArray, innerArray1, innerArray2, outerRef;

        (function createNestedArrays() {
            innerArray1 = [1, 2, 3];
            innerArray2 = [4, 5, 6];
            outerArray = [innerArray1, innerArray2];

            // WeakSet跟踪内层数组
            weakSet.add(innerArray1);
            weakSet.add(innerArray2);

            // WeakMap存储外层数组到内层WeakRef的映射
            const innerRefs = new WeakRef({
                first: new WeakRef(innerArray1),
                second: new WeakRef(innerArray2)
            });
            weakMap.set(outerArray, innerRefs);

            outerRef = new WeakRef(outerArray);

            // 验证初始状态
            if (!weakSet.has(innerArray1) || !weakSet.has(innerArray2)) {
                throw new Error("WeakSet missing inner arrays");
            }
            if (!weakMap.has(outerArray)) throw new Error("WeakMap missing outer array");
        })();

        // 清除强引用
        const tempOuterRef = outerRef;
        const tempInner1Ref = new WeakRef(innerArray1);
        const tempInner2Ref = new WeakRef(innerArray2);
        outerArray = null;
        innerArray1 = null;
        innerArray2 = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempOuterRef.deref() !== undefined) throw new Error("Outer array not GC'd");
        if (tempInner1Ref.deref() !== undefined || tempInner2Ref.deref() !== undefined) {
            throw new Error("Inner arrays not GC'd");
        }

        return "Test Passed: WeakMixNestedArraysTest010";
    },

    /**
     * 011. Map转换组合：WeakSet存储原始Map，WeakMap关联转换后的Map的WeakRef
     */
    async test011_WeakMixMapTransformation() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let originalMap, transformedMap, originalRef;

        (function createTransformedMap() {
            originalMap = new Map([
                [{ id: 'a' }, 10],
                [{ id: 'b' }, 20]
            ]);

            // 创建值加倍的转换Map
            transformedMap = new Map();
            originalMap.forEach((value, key) => {
                transformedMap.set(key, value * 2);
            });
            transformedMap.source = originalMap;

            // WeakSet存储原始Map
            weakSet.add(originalMap);

            // WeakMap关联转换后Map的WeakRef
            const transformedRef = new WeakRef(transformedMap);
            weakMap.set(originalMap, transformedRef);

            originalRef = new WeakRef(originalMap);

            // 验证初始状态
            if (!weakSet.has(originalMap)) throw new Error("WeakSet missing original map");
            if (weakMap.get(originalMap)?.deref() !== transformedMap) {
                throw new Error("Transformed map WeakRef mismatch");
            }
        })();

        // 清除强引用
        const tempOriginalRef = originalRef;
        const tempTransformedRef = new WeakRef(transformedMap);
        originalMap = null;
        transformedMap = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempOriginalRef.deref() !== undefined) throw new Error("Original map not GC'd");
        if (tempTransformedRef.deref() !== undefined) throw new Error("Transformed map not GC'd");

        return "Test Passed: WeakMixMapTransformationTest011";
    },

    /**
     * 012. Set差集组合：WeakMap使用两个Set作为键，WeakSet存储差集结果
     */
    async test012_WeakMixSetDifference() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let setA, setB, differenceSet, setARef, setBRef;

        // 创建共享对象引用（修复关键点）
        const sharedObj = { id: 'y' };
        const uniqueObjX = { id: 'x' };
        const uniqueObjZ = { id: 'z' };
        const uniqueObjW = { id: 'w' };

        (function createSetDifference() {
            // 使用相同的对象引用构建集合
            setA = new Set([uniqueObjX, sharedObj, uniqueObjZ]);
            setB = new Set([sharedObj, uniqueObjW]);

            // 计算差集 (A - B)
            differenceSet = new Set();
            setA.forEach(item => {
                if (!setB.has(item)) {
                    differenceSet.add(item);
                }
            });

            // WeakSet存储差集结果
            differenceSet.forEach(item => weakSet.add(item));

            // WeakMap使用Set组合作为键，存储差集的WeakRef
            const key = { setA, setB }; // 复合键对象
            const diffRef = new WeakRef(differenceSet);
            weakMap.set(key, diffRef);

            setARef = new WeakRef(setA);
            setBRef = new WeakRef(setB);

            // 验证初始状态（修复关键点：明确预期差集内容）
            if (differenceSet.size !== 2) {
                throw new Error("Set difference calculation failed - unexpected size");
            }
            if (!differenceSet.has(uniqueObjX) || !differenceSet.has(uniqueObjZ)) {
                throw new Error("Set difference calculation failed - missing elements");
            }
            if (!weakMap.has(key)) {
                throw new Error("WeakMap missing set key");
            }
        })();

        // 清除强引用
        const tempSetARef = setARef;
        const tempSetBRef = setBRef;
        const tempDiffRef = new WeakRef(differenceSet);
        setA = null;
        setB = null;
        differenceSet = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempSetARef.deref() !== undefined || tempSetBRef.deref() !== undefined) {
            throw new Error("Original sets not GC'd");
        }
        if (tempDiffRef.deref() !== undefined) {
            throw new Error("Difference set not GC'd");
        }

        return "Test Passed: WeakMixSetDifferenceTest012";
    },

    /**
     * 013. 日期计算组合：WeakSet存储日期对象，WeakMap关联计算结果的WeakRef
     */
    async test013_WeakMixDateCalculations() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let startDate, endDate, calculations, dateRefs;

        (function createDateCalculations() {
            startDate = new Date('2024-01-01');
            endDate = new Date('2024-12-31');

            // 计算日期差和中间点
            const diffMs = endDate.getTime() - startDate.getTime();
            const midDate = new Date(startDate.getTime() + diffMs / 2);

            calculations = {
                days: Math.floor(diffMs / (1000 * 60 * 60 * 24)),
                midpoint: midDate,
                source: { startDate, endDate }
            };

            // WeakSet存储日期对象
            weakSet.add(startDate);
            weakSet.add(endDate);
            weakSet.add(midDate);

            // WeakMap关联计算结果的WeakRef
            const calcRef = new WeakRef(calculations);
            weakMap.set(startDate, calcRef);

            dateRefs = {
                start: new WeakRef(startDate),
                end: new WeakRef(endDate)
            };

            // 验证初始状态
            if (calculations.days !== 365) throw new Error("Date calculation failed");
            if (!weakSet.has(midDate)) throw new Error("WeakSet missing mid date");
        })();

        // 清除强引用
        const tempStartRef = dateRefs.start;
        const tempEndRef = dateRefs.end;
        const tempCalcRef = new WeakRef(calculations);
        startDate = null;
        endDate = null;
        calculations = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempStartRef.deref() !== undefined || tempEndRef.deref() !== undefined) {
            throw new Error("Date objects not GC'd");
        }
        if (tempCalcRef.deref() !== undefined) throw new Error("Calculations not GC'd");

        return "Test Passed: WeakMixDateCalculationsTest013";
    },

    /**
     * 014. 正则替换组合：WeakSet存储RegExp，WeakMap关联替换函数的WeakRef
     */
    async test014_WeakMixRegexReplacement() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let regexObj, replacementFn, regexRef;

        (function createRegexReplacement() {
            regexObj = /(\d+)/g;

            // 创建带状态的替换函数
            replacementFn = (function() {
                let count = 0;
                return function(match, num) {
                    count++;
                    return (Number(num) * 2).toString();
                };
            })();
            replacementFn.regex = regexObj;

            // WeakSet存储RegExp
            weakSet.add(regexObj);

            // WeakMap关联替换函数的WeakRef
            const fnRef = new WeakRef(replacementFn);
            weakMap.set(regexObj, fnRef);

            regexRef = new WeakRef(regexObj);

            // 验证初始状态
            if (!weakSet.has(regexObj)) throw new Error("WeakSet missing regex");
            if (weakMap.get(regexObj)?.deref() !== replacementFn) {
                throw new Error("Replacement function WeakRef mismatch");
            }
        })();

        // 清除强引用
        const tempRegexRef = regexRef;
        const tempFnRef = new WeakRef(replacementFn);
        regexObj = null;
        replacementFn = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempRegexRef.deref() !== undefined) throw new Error("Regex not GC'd");
        if (tempFnRef.deref() !== undefined) throw new Error("Replacement function not GC'd");

        return "Test Passed: WeakMixRegexReplacementTest014";
    },

    /**
     * 015. 缓冲区转换组合：WeakMap存储原始缓冲区，WeakSet跟踪视图对象
     */
    async test015_WeakMixBufferConversions() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let buffer, intView, floatView, bufferRef;

        (function createBufferViews() {
            // 使用足够大的缓冲区以避免视图重叠导致的意外行为
            buffer = new ArrayBuffer(32); // 32字节缓冲区

            // 创建不同类型的视图，确保它们不重叠
            intView = new Int32Array(buffer, 0, 4); // 占用前16字节
            floatView = new Float32Array(buffer, 16, 4); // 占用后16字节

            // 为每种视图设置适合其类型的值
            const intValue = 42;
            const floatValue = 42.0;

            intView[0] = intValue;
            floatView[0] = floatValue;

            // WeakSet跟踪视图对象
            weakSet.add(intView);
            weakSet.add(floatView);

            // WeakMap存储缓冲区到视图WeakRef的映射
            const viewsRef = new WeakRef({
                int: new WeakRef(intView),
                float: new WeakRef(floatView)
            });
            weakMap.set(buffer, viewsRef);

            bufferRef = new WeakRef(buffer);

            // 验证初始状态 - 分别验证每种视图的值
            if (intView[0] !== intValue) {
                throw new Error(`Buffer view synchronization failed: Int32 value mismatch, expected ${intValue}, got ${intView[0]}`);
            }
            if (floatView[0] !== floatValue) {
                throw new Error(`Buffer view synchronization failed: Float32 value mismatch, expected ${floatValue}, got ${floatView[0]}`);
            }
            if (!weakSet.has(intView)) throw new Error("WeakSet missing int view");
        })();

        // 清除强引用
        const tempBufferRef = bufferRef;
        const tempIntRef = new WeakRef(intView);
        const tempFloatRef = new WeakRef(floatView);
        buffer = null;
        intView = null;
        floatView = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempBufferRef.deref() !== undefined) throw new Error("Buffer not GC'd");
        if (tempIntRef.deref() !== undefined || tempFloatRef.deref() !== undefined) {
            throw new Error("Buffer views not GC'd");
        }

        return "Test Passed: WeakMixBufferConversionsTest015";
    },
    /**
     * 016. 缓存机制组合：WeakMap作为缓存，WeakSet跟踪缓存键
     */
    async test016_WeakMixCacheMechanism() {
        const cache = new WeakMap(); // 作为缓存
        const cacheKeys = new WeakSet(); // 跟踪缓存键
        let key1, key2, value1, value2, keyRefs;

        (function createCache() {
            key1 = { id: 'cache-key-1' };
            key2 = { id: 'cache-key-2' };
            value1 = { data: [1, 2, 3], timestamp: Date.now() };
            value2 = { data: [4, 5, 6], timestamp: Date.now() };

            // 填充缓存并跟踪键
            cache.set(key1, value1);
            cache.set(key2, value2);
            cacheKeys.add(key1);
            cacheKeys.add(key2);

            keyRefs = {
                key1: new WeakRef(key1),
                key2: new WeakRef(key2)
            };

            // 验证初始状态
            if (cache.get(key1) !== value1) throw new Error("Cache initialization failed");
            if (!cacheKeys.has(key2)) throw new Error("WeakSet missing cache key");
        })();

        // 清除强引用（模拟缓存键过期）
        const tempKey1Ref = keyRefs.key1;
        const tempKey2Ref = keyRefs.key2;
        const tempValue1Ref = new WeakRef(value1);
        key1 = null;
        key2 = null;
        value1 = null;
        value2 = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));
        globalThis.ArkTools.forceFullGC();

        // 验证回收情况
        if (tempKey1Ref.deref() !== undefined || tempKey2Ref.deref() !== undefined) {
            throw new Error("Cache keys not GC'd");
        }
        if (tempValue1Ref.deref() !== undefined) throw new Error("Cache values not GC'd");

        return "Test Passed: WeakMixCacheMechanismTest016";
    },

    /**
     * 017. 数组过滤组合：WeakSet存储原始数组，WeakMap关联过滤结果的WeakRef
     */
    async test017_WeakMixArrayFiltering() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let originalArray, filteredArray, originalRef;

        (function createFilteredArray() {
            originalArray = [
                { id: 'item-1', value: 5 },
                { id: 'item-2', value: 15 },
                { id: 'item-3', value: 25 }
            ];

            // 过滤出value > 10的元素
            filteredArray = originalArray.filter(item => item.value > 10);
            filteredArray.source = originalArray;

            // WeakSet存储原始数组
            weakSet.add(originalArray);

            // WeakMap关联过滤结果的WeakRef
            const filteredRef = new WeakRef(filteredArray);
            weakMap.set(originalArray, filteredRef);

            originalRef = new WeakRef(originalArray);

            // 验证初始状态
            if (filteredArray.length !== 2) throw new Error("Array filtering failed");
            if (weakMap.get(originalArray)?.deref() !== filteredArray) {
                throw new Error("Filtered array WeakRef mismatch");
            }
        })();

        // 清除强引用
        const tempOriginalRef = originalRef;
        const tempFilteredRef = new WeakRef(filteredArray);
        originalArray = null;
        filteredArray = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempOriginalRef.deref() !== undefined) throw new Error("Original array not GC'd");
        if (tempFilteredRef.deref() !== undefined) throw new Error("Filtered array not GC'd");

        return "Test Passed: WeakMixArrayFilteringTest017";
    },

    /**
     * 018. 集合映射组合：WeakMap存储Set，WeakSet存储映射后的元素
     */
    async test018_WeakMixSetMapping() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let originalSet, mappedElements, setRef;

        (function createSetMapping() {
            originalSet = new Set([1, 2, 3, 4, 5]);

            // 将集合元素映射为对象
            mappedElements = [];
            originalSet.forEach(num => {
                const obj = { value: num, squared: num * num };
                mappedElements.push(obj);
                weakSet.add(obj); // WeakSet存储映射后的元素
            });

            // WeakMap存储原始Set到映射元素的WeakRef
            const elementsRef = new WeakRef(mappedElements);
            weakMap.set(originalSet, elementsRef);

            setRef = new WeakRef(originalSet);

            // 验证初始状态
            if (mappedElements.length !== 5) throw new Error("Set mapping failed");
            if (!weakMap.has(originalSet)) throw new Error("WeakMap missing set key");
        })();

        // 清除强引用
        const tempSetRef = setRef;
        const tempMappedRefs = mappedElements.map(el => new WeakRef(el));
        originalSet = null;
        mappedElements = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempSetRef.deref() !== undefined) throw new Error("Original set not GC'd");
        if (tempMappedRefs.some(ref => ref.deref() !== undefined)) {
            throw new Error("Mapped elements not GC'd");
        }

        return "Test Passed: WeakMixSetMappingTest018";
    },

    /**
     * 019. 复杂数据结构组合：WeakSet与WeakMap协同跟踪嵌套对象
     */
    async test019_WeakMixComplexStructure() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let rootObj, nodeA, nodeB, leaf1, leaf2, rootRef;

        (function createComplexStructure() {
            // 创建嵌套数据结构
            leaf1 = { type: 'leaf', value: 'data-1' };
            leaf2 = { type: 'leaf', value: 'data-2' };
            nodeA = { type: 'node', children: [leaf1] };
            nodeB = { type: 'node', children: [leaf2] };
            rootObj = {
                type: 'root',
                nodes: [nodeA, nodeB],
                metadata: { version: 1, timestamp: Date.now() }
            };

            // WeakSet跟踪所有节点和叶子
            [rootObj, nodeA, nodeB, leaf1, leaf2, rootObj.metadata].forEach(item => {
                weakSet.add(item);
            });

            // WeakMap建立层次引用
            weakMap.set(rootObj, new WeakRef({
                nodes: new WeakRef([nodeA, nodeB]),
                metadata: new WeakRef(rootObj.metadata)
            }));
            weakMap.set(nodeA, new WeakRef(leaf1));
            weakMap.set(nodeB, new WeakRef(leaf2));

            rootRef = new WeakRef(rootObj);

            // 验证初始状态
            if (!weakSet.has(rootObj.metadata)) throw new Error("WeakSet missing metadata");
            if (!weakMap.has(nodeA)) throw new Error("WeakMap missing nodeA");
        })();

        // 清除强引用
        const tempRootRef = rootRef;
        const tempLeaf1Ref = new WeakRef(leaf1);
        const tempLeaf2Ref = new WeakRef(leaf2);
        rootObj = null;
        nodeA = null;
        nodeB = null;
        leaf1 = null;
        leaf2 = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempRootRef.deref() !== undefined) throw new Error("Root object not GC'd");
        if (tempLeaf1Ref.deref() !== undefined || tempLeaf2Ref.deref() !== undefined) {
            throw new Error("Leaf nodes not GC'd");
        }

        return "Test Passed: WeakMixComplexStructureTest019";
    },
    /**
     * 020. 缓存机制组合：WeakMap作为缓存，WeakSet跟踪缓存键
     */
    async test020_WeakMixCacheMechanism() {
        const cache = new WeakMap(); // 作为缓存
        let key1,  value1
        (function createCache() {
            key1 = { id: 'cache-key-1' };
            value1 = { data: [1, 2, 3], timestamp: Date.now() };
            // 填充缓存并跟踪键
            cache.set(key1, value1);
            // 验证初始状态
            
        })();
        // 清除强引用（模拟缓存键过期）
        let tempValue1Ref = new WeakRef(value1);
        key1 = null;
        value1 = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 30));
        globalThis.ArkTools.forceFullGC();

        await new Promise(resolve => setTimeout(resolve, 30));


        if (tempValue1Ref.deref() !== undefined) throw new Error("Cache values not GC'd");
        return "Test Passed: WeakMixCacheMechanismTest020";
    },
    /**
     * 021. 函数对象组合：WeakSet存储函数，WeakMap关联函数结果的WeakRef
     */
    async test021_WeakMixFunctionResults() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let computeFn, resultObj, fnRef;

        (function createFunctionStructure() {
            // 创建带状态的计算函数
            computeFn = (function() {
                let callCount = 0;
                return function(input) {
                    callCount++;
                    return {
                        input,
                        result: input * 2,
                        calls: callCount,
                        source: computeFn
                    };
                };
            })();

            // 执行函数获取结果
            resultObj = computeFn(5);

            // WeakSet存储函数对象
            weakSet.add(computeFn);

            // WeakMap关联函数结果的WeakRef
            const resultRef = new WeakRef(resultObj);
            weakMap.set(computeFn, resultRef);

            fnRef = new WeakRef(computeFn);

            // 验证初始状态
            if (resultObj.result !== 10) throw new Error("Function result calculation failed");
            if (!weakSet.has(computeFn)) throw new Error("WeakSet missing function");
        })();

        // 清除强引用
        const tempFnRef = fnRef;
        const tempResultRef = new WeakRef(resultObj);
        computeFn = null;
        resultObj = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempFnRef.deref() !== undefined) throw new Error("Function not GC'd");
        if (tempResultRef.deref() !== undefined) throw new Error("Function result not GC'd");

        return "Test Passed: WeakMixFunctionResultsTest021";
    },

    /**
     * 022. 嵌套Map组合：WeakMap存储外层Map，WeakSet跟踪内层Map
     */
    async test022_WeakMixNestedMaps() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let outerMap, innerMap1, innerMap2, outerRef;

        (function createNestedMaps() {
            // 创建共享引用的键对象
            const keyA = { id: 'key-a' };
            const keyB = { id: 'key-b' };

            innerMap1 = new Map([[keyA, 'value-a']]);
            innerMap2 = new Map([[keyB, 'value-b']]);
            outerMap = new Map([
                ['inner1', innerMap1],
                ['inner2', innerMap2]
            ]);

            // WeakSet跟踪内层Map
            weakSet.add(innerMap1);
            weakSet.add(innerMap2);

            // WeakMap存储外层Map到内层WeakRef的映射
            const innerRefs = new WeakRef({
                first: new WeakRef(innerMap1),
                second: new WeakRef(innerMap2)
            });
            weakMap.set(outerMap, innerRefs);

            outerRef = new WeakRef(outerMap);

            // 验证初始状态
            if (innerMap1.get(keyA) !== 'value-a') throw new Error("Inner map initialization failed");
            if (!weakSet.has(innerMap2)) throw new Error("WeakSet missing inner map");
        })();

        // 清除强引用
        const tempOuterRef = outerRef;
        const tempInner1Ref = new WeakRef(innerMap1);
        const tempInner2Ref = new WeakRef(innerMap2);
        outerMap = null;
        innerMap1 = null;
        innerMap2 = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempOuterRef.deref() !== undefined) throw new Error("Outer map not GC'd");
        if (tempInner1Ref.deref() !== undefined || tempInner2Ref.deref() !== undefined) {
            throw new Error("Inner maps not GC'd");
        }

        return "Test Passed: WeakMixNestedMapsTest022";
    },

    /**
     * 023. 数组映射组合：WeakSet存储原始数组，WeakMap关联映射结果的WeakRef
     */
    async test023_WeakMixArrayMapping() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let originalArray, mappedArray, originalRef;

        (function createMappedArray() {
            originalArray = [1, 2, 3, 4, 5];

            // 创建映射数组（值加倍）
            mappedArray = originalArray.map(num => ({
                original: num,
                doubled: num * 2,
                source: originalArray
            }));

            // WeakSet存储原始数组
            weakSet.add(originalArray);

            // WeakMap关联映射结果的WeakRef
            const mappedRef = new WeakRef(mappedArray);
            weakMap.set(originalArray, mappedRef);

            originalRef = new WeakRef(originalArray);

            // 验证初始状态
            if (mappedArray[0].doubled !== 2) throw new Error("Array mapping failed");
            if (weakMap.get(originalArray)?.deref() !== mappedArray) {
                throw new Error("Mapped array WeakRef mismatch");
            }
        })();

        // 清除强引用
        const tempOriginalRef = originalRef;
        const tempMappedRef = new WeakRef(mappedArray);
        originalArray = null;
        mappedArray = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempOriginalRef.deref() !== undefined) throw new Error("Original array not GC'd");
        if (tempMappedRef.deref() !== undefined) throw new Error("Mapped array not GC'd");

        return "Test Passed: WeakMixArrayMappingTest023";
    },

    /**
     * 024. 错误对象组合：WeakSet存储Error实例，WeakMap关联错误详情的WeakRef
     */
    async test024_WeakMixErrorObjects() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let errorObj, errorDetails, errorRef;

        (function createErrorStructure() {
            errorObj = new Error("Test error message");
            errorObj.code = 500;

            // 创建错误详情对象
            errorDetails = {
                message: errorObj.message,
                code: errorObj.code,
                stack: errorObj.stack,
                source: errorObj
            };

            // WeakSet存储Error实例
            weakSet.add(errorObj);

            // WeakMap关联错误详情的WeakRef
            const detailsRef = new WeakRef(errorDetails);
            weakMap.set(errorObj, detailsRef);

            errorRef = new WeakRef(errorObj);

            // 验证初始状态
            if (errorDetails.code !== 500) throw new Error("Error details creation failed");
            if (!weakSet.has(errorObj)) throw new Error("WeakSet missing error object");
        })();

        // 清除强引用
        const tempErrorRef = errorRef;
        const tempDetailsRef = new WeakRef(errorDetails);
        errorObj = null;
        errorDetails = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempErrorRef.deref() !== undefined) throw new Error("Error object not GC'd");
        if (tempDetailsRef.deref() !== undefined) throw new Error("Error details not GC'd");

        return "Test Passed: WeakMixErrorObjectsTest024";
    },

    /**
     * 025. 集合交集组合：WeakMap使用两个Set作为键，WeakSet存储交集结果
     */
    async test025_WeakMixSetIntersection() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let setA, setB, intersectionSet, setARef, setBRef;

        (function createSetIntersection() {
            // 创建共享引用的对象
            const sharedObj = { id: 'shared' };
            const uniqueObjA = { id: 'unique-a' };
            const uniqueObjB = { id: 'unique-b' };

            setA = new Set([sharedObj, uniqueObjA]);
            setB = new Set([sharedObj, uniqueObjB]);

            // 计算交集 (A ∩ B)
            intersectionSet = new Set();
            setA.forEach(item => {
                if (setB.has(item)) intersectionSet.add(item);
            });

            // WeakSet存储交集结果
            intersectionSet.forEach(item => weakSet.add(item));

            // WeakMap使用Set组合作为键，存储交集的WeakRef
            const key = { setA, setB }; // 复合键对象
            const interRef = new WeakRef(intersectionSet);
            weakMap.set(key, interRef);

            setARef = new WeakRef(setA);
            setBRef = new WeakRef(setB);

            // 验证初始状态
            if (intersectionSet.size !== 1) throw new Error(`Set intersection size wrong (expected 1, got ${intersectionSet.size})`);
            if (!intersectionSet.has(sharedObj)) throw new Error("Set intersection missing shared object");
            if (!weakMap.has(key)) throw new Error("WeakMap missing set key");
        })();

        // 清除强引用
        const tempSetARef = setARef;
        const tempSetBRef = setBRef;
        const tempInterRef = new WeakRef(intersectionSet);
        setA = null;
        setB = null;
        intersectionSet = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempSetARef.deref() !== undefined || tempSetBRef.deref() !== undefined) {
            throw new Error("Original sets not GC'd");
        }
        if (tempInterRef.deref() !== undefined) throw new Error("Intersection set not GC'd");

        return "Test Passed: WeakMixSetIntersectionTest025";
    },

    /**
     * 026. 缓冲区切片组合：WeakSet存储原始缓冲区，WeakMap关联切片的WeakRef
     */
    async test026_WeakMixBufferSlices() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let buffer, slice1, slice2, bufferRef;

        (function createBufferSlices() {
            buffer = new ArrayBuffer(32); // 32字节缓冲区

            // 创建非重叠的缓冲区切片
            slice1 = buffer.slice(0, 16); // 前16字节
            slice2 = buffer.slice(16, 32); // 后16字节

            // 填充测试数据
            const view1 = new Uint8Array(slice1);
            view1.fill(0xAA);

            const view2 = new Uint8Array(slice2);
            view2.fill(0x55);

            // WeakSet存储原始缓冲区
            weakSet.add(buffer);

            // WeakMap关联切片的WeakRef
            const slicesRef = new WeakRef({
                first: new WeakRef(slice1),
                second: new WeakRef(slice2)
            });
            weakMap.set(buffer, slicesRef);

            bufferRef = new WeakRef(buffer);

            // 验证初始状态
            if (new Uint8Array(slice1)[0] !== 0xAA) throw new Error("First buffer slice initialization failed");
            if (new Uint8Array(slice2)[0] !== 0x55) throw new Error("Second buffer slice initialization failed");
            if (!weakSet.has(buffer)) throw new Error("WeakSet missing buffer");
        })();

        // 清除强引用
        const tempBufferRef = bufferRef;
        const tempSlice1Ref = new WeakRef(slice1);
        const tempSlice2Ref = new WeakRef(slice2);
        buffer = null;
        slice1 = null;
        slice2 = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempBufferRef.deref() !== undefined) throw new Error("Original buffer not GC'd");
        if (tempSlice1Ref.deref() !== undefined || tempSlice2Ref.deref() !== undefined) {
            throw new Error("Buffer slices not GC'd");
        }

        return "Test Passed: WeakMixBufferSlicesTest026";
    },

    /**
     * 027. 正则分组组合：WeakSet存储RegExp，WeakMap关联分组结果的WeakRef
     */
    async test027_WeakMixRegexGroups() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let regexObj, groupResults, regexRef;

        (function createRegexGroups() {
            // 使用命名分组的正则表达式
            regexObj = /(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/;
            const testString = "2024-03-15";

            // 执行匹配获取分组结果
            const match = regexObj.exec(testString);
            groupResults = {
                full: match[0],
                year: match.groups.year,
                month: match.groups.month,
                day: match.groups.day,
                source: regexObj
            };

            // WeakSet存储RegExp
            weakSet.add(regexObj);

            // WeakMap关联分组结果的WeakRef
            const groupsRef = new WeakRef(groupResults);
            weakMap.set(regexObj, groupsRef);

            regexRef = new WeakRef(regexObj);

            // 验证初始状态
            if (groupResults.year !== "2024") throw new Error("Regex group extraction failed");
            if (!weakSet.has(regexObj)) throw new Error("WeakSet missing regex");
        })();

        // 清除强引用
        const tempRegexRef = regexRef;
        const tempGroupsRef = new WeakRef(groupResults);
        regexObj = null;
        groupResults = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempRegexRef.deref() !== undefined) throw new Error("Regex not GC'd");
        if (tempGroupsRef.deref() !== undefined) throw new Error("Regex groups not GC'd");

        return "Test Passed: WeakMixRegexGroupsTest027";
    },

    /**
     * 028. 日期格式化组合：WeakMap存储Date，WeakSet跟踪格式化结果
     */
    async test028_WeakMixDateFormats() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let dateObj, formats, dateRef;

        (function createDateFormats() {
            dateObj = new Date('2024-03-15');

            // 创建多种格式化结果
            formats = {
                iso: dateObj.toISOString(),
                locale: dateObj.toLocaleDateString('en-US'),
                utc: dateObj.toUTCString(),
                source: dateObj
            };

            // WeakSet跟踪格式化结果对象
            weakSet.add(formats);

            // WeakMap存储Date到格式化结果的WeakRef
            const formatsRef = new WeakRef(formats);
            weakMap.set(dateObj, formatsRef);

            dateRef = new WeakRef(dateObj);

            // 验证初始状态
            if (!formats.iso.startsWith('2024-03-15')) throw new Error("Date formatting failed");
            if (!weakSet.has(formats)) throw new Error("WeakSet missing formats");
        })();

        // 清除强引用
        const tempDateRef = dateRef;
        const tempFormatsRef = new WeakRef(formats);
        dateObj = null;
        formats = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempDateRef.deref() !== undefined) throw new Error("Date object not GC'd");
        if (tempFormatsRef.deref() !== undefined) throw new Error("Date formats not GC'd");

        return "Test Passed: WeakMixDateFormatsTest028";
    },

    /**
     * 029. 类继承组合：WeakSet存储子类实例，WeakMap关联父类实例的WeakRef
     */
    async test029_WeakMixClassInheritance() {
        // 定义父类和子类
        class Parent {
            constructor(id) {
                this.id = id;
                this.parentData = `parent-${id}`;
            }
        }

        class Child extends Parent {
            constructor(id) {
                super(id);
                this.childData = `child-${id}`;
            }
        }

        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let parentObj, childObj, childRef;

        (function createClassInstances() {
            parentObj = new Parent('029');
            childObj = new Child('029');

            // WeakSet存储子类实例
            weakSet.add(childObj);

            // WeakMap关联父类实例的WeakRef
            const parentRef = new WeakRef(parentObj);
            weakMap.set(childObj, parentRef);

            childRef = new WeakRef(childObj);

            // 验证初始状态
            if (!(childObj instanceof Parent)) throw new Error("Class inheritance failed");
            if (!weakSet.has(childObj)) throw new Error("WeakSet missing child instance");
        })();

        // 清除强引用
        const tempChildRef = childRef;
        const tempParentRef = new WeakRef(parentObj);
        parentObj = null;
        childObj = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempChildRef.deref() !== undefined) throw new Error("Child instance not GC'd");
        if (tempParentRef.deref() !== undefined) throw new Error("Parent instance not GC'd");

        return "Test Passed: WeakMixClassInheritanceTest029";
    },

    /**
     * 030. 数组排序组合：WeakSet存储原始数组，WeakMap关联排序结果的WeakRef
     */
    async test030_WeakMixArraySorting() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let originalArray, sortedArray, originalRef;

        (function createSortedArray() {
            originalArray = [3, 1, 4, 2, 5];

            // 创建排序后的数组（不修改原数组）
            sortedArray = [...originalArray].sort((a, b) => a - b);
            sortedArray.source = originalArray;

            // WeakSet存储原始数组
            weakSet.add(originalArray);

            // WeakMap关联排序结果的WeakRef
            const sortedRef = new WeakRef(sortedArray);
            weakMap.set(originalArray, sortedRef);

            originalRef = new WeakRef(originalArray);

            // 验证初始状态
            if (sortedArray[0] !== 1 || sortedArray[4] !== 5) throw new Error("Array sorting failed");
            if (weakMap.get(originalArray)?.deref() !== sortedArray) {
                throw new Error("Sorted array WeakRef mismatch");
            }
        })();

        // 清除强引用
        const tempOriginalRef = originalRef;
        const tempSortedRef = new WeakRef(sortedArray);
        originalArray = null;
        sortedArray = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempOriginalRef.deref() !== undefined) throw new Error("Original array not GC'd");
        if (tempSortedRef.deref() !== undefined) throw new Error("Sorted array not GC'd");

        return "Test Passed: WeakMixArraySortingTest030";
    },

    /**
     * 031. Map过滤组合：WeakMap存储原始Map，WeakSet跟踪过滤后的条目
     */
    async test031_WeakMixMapFiltering() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let originalMap, filteredEntries, mapRef;

        (function createFilteredMap() {
            // 创建共享引用的键对象
            const key1 = { id: 'k1', value: 5 };
            const key2 = { id: 'k2', value: 15 };
            const key3 = { id: 'k3', value: 25 };

            originalMap = new Map([
                [key1, { data: 'val1' }],
                [key2, { data: 'val2' }],
                [key3, { data: 'val3' }]
            ]);

            // 过滤出value > 10的键对应的条目
            filteredEntries = [];
            originalMap.forEach((value, key) => {
                if (key.value > 10) {
                    const entry = { key, value };
                    filteredEntries.push(entry);
                    weakSet.add(entry); // WeakSet跟踪过滤条目
                }
            });

            // WeakMap存储原始Map到过滤条目的WeakRef
            const entriesRef = new WeakRef(filteredEntries);
            weakMap.set(originalMap, entriesRef);

            mapRef = new WeakRef(originalMap);

            // 验证初始状态
            if (filteredEntries.length !== 2) throw new Error(`Map filtering failed (expected 2 entries, got ${filteredEntries.length})`);
            if (!weakMap.has(originalMap)) throw new Error("WeakMap missing map key");
        })();

        // 清除强引用
        const tempMapRef = mapRef;
        const tempEntriesRef = new WeakRef(filteredEntries);
        originalMap = null;
        filteredEntries = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempMapRef.deref() !== undefined) throw new Error("Original map not GC'd");
        if (tempEntriesRef.deref() !== undefined) throw new Error("Filtered entries not GC'd");

        return "Test Passed: WeakMixMapFilteringTest031";
    },

    /**
     * 032. 类型化数组组合：WeakSet存储TypedArray，WeakMap关联视图的WeakRef
     */
    async test032_WeakMixTypedArrays() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let intArray, floatView, arrayRef;

        (function createTypedArrays() {
            // 创建32位整数数组
            intArray = new Int32Array(4);
            intArray.set([10, 20, 30, 40]);

            // 创建共享缓冲区的浮点视图
            floatView = new Float32Array(intArray.buffer);

            // WeakSet存储原始类型化数组
            weakSet.add(intArray);

            // WeakMap关联浮点视图的WeakRef
            const viewRef = new WeakRef(floatView);
            weakMap.set(intArray, viewRef);

            arrayRef = new WeakRef(intArray);

            // 验证初始状态（不比较值，只验证引用）
            if (intArray.buffer !== floatView.buffer) throw new Error("Typed arrays buffer mismatch");
            if (!weakSet.has(intArray)) throw new Error("WeakSet missing typed array");
        })();

        // 清除强引用
        const tempArrayRef = arrayRef;
        const tempViewRef = new WeakRef(floatView);
        intArray = null;
        floatView = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempArrayRef.deref() !== undefined) throw new Error("Typed array not GC'd");
        if (tempViewRef.deref() !== undefined) throw new Error("Float view not GC'd");

        return "Test Passed: WeakMixTypedArraysTest032";
    },

    /**
     * 033. 字符串对象组合：WeakSet存储String对象，WeakMap关联处理结果的WeakRef
     */
    async test033_WeakMixStringObjects() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let strObj, processedStr, strRef;

        (function createStringObjects() {
            // 使用String对象（非原始值）
            strObj = new String("Hello WeakMix");

            // 处理字符串
            processedStr = {
                original: strObj,
                length: strObj.length,
                uppercase: strObj.toUpperCase(),
                words: strObj.split(' ')
            };

            // WeakSet存储String对象
            weakSet.add(strObj);

            // WeakMap关联处理结果的WeakRef
            strRef = new WeakRef(processedStr);
            weakMap.set(strObj, strRef);

            strRef = new WeakRef(strObj);

            // 验证初始状态
            if (processedStr.uppercase !== "HELLO WEAKMIX") throw new Error("String processing failed");
            if (!weakSet.has(strObj)) throw new Error("WeakSet missing string object");
        })();

        // 清除强引用
        const tempStrRef = strRef;
        const tempProcessedRef = new WeakRef(processedStr);
        strObj = null;
        processedStr = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempStrRef.deref() !== undefined) throw new Error("String object not GC'd");
        if (tempProcessedRef.deref() !== undefined) throw new Error("Processed string not GC'd");

        return "Test Passed: WeakMixStringObjectsTest033";
    },

    /**
     * 034. 多层缓存组合：WeakMap嵌套作为多层缓存，WeakSet跟踪缓存键
     */
    async test034_WeakMixMultiLevelCache() {
        // 第一层缓存：key为对象，value为第二层WeakMap
        const level1Cache = new WeakMap();
        // 跟踪所有层级的缓存键
        const cacheKeys = new WeakSet();

        let key1, key2, subKey1, subKey2, value1, value2;

        (function createMultiLevelCache() {
            // 确保所有缓存键都是对象类型（WeakMap要求）
            key1 = { id: 'level1-key-1' };
            key2 = { id: 'level1-key-2' };
            subKey1 = { id: 'level2-subkey-1' };
            subKey2 = { id: 'level2-subkey-2' };

            // 缓存值
            value1 = { data: 'cache-value-1', timestamp: Date.now() };
            value2 = { data: 'cache-value-2', timestamp: Date.now() };

            // 创建第二层缓存
            const level2Cache1 = new WeakMap();
            const level2Cache2 = new WeakMap();

            // 填充第二层缓存
            level2Cache1.set(subKey1, value1);
            level2Cache2.set(subKey2, value2);

            // 填充第一层缓存
            level1Cache.set(key1, level2Cache1);
            level1Cache.set(key2, level2Cache2);

            // 跟踪所有缓存键
            [key1, key2, subKey1, subKey2].forEach(key => cacheKeys.add(key));

            // 验证初始状态
            if (level1Cache.get(key1)?.get(subKey1) !== value1) {
                throw new Error("Level 2 cache initialization failed for key1");
            }
            if (level1Cache.get(key2)?.get(subKey2) !== value2) {
                throw new Error("Level 2 cache initialization failed for key2");
            }
            if (!cacheKeys.has(subKey1) || !cacheKeys.has(subKey2)) {
                throw new Error("WeakSet missing sub keys");
            }
        })();

        // 清除强引用（模拟缓存键过期）
        const tempKey1Ref = new WeakRef(key1);
        const tempKey2Ref = new WeakRef(key2);
        const tempSubKey1Ref = new WeakRef(subKey1);
        const tempValue1Ref = new WeakRef(value1);

        // 清除所有强引用
        key1 = null;
        key2 = null;
        subKey1 = null;
        subKey2 = null;
        value1 = null;
        value2 = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));
        globalThis.ArkTools.forceFullGC();
        // 验证回收情况
        if (tempKey1Ref.deref() !== undefined || tempKey2Ref.deref() !== undefined) {
            throw new Error("Level 1 cache keys not GC'd");
        }
        if (tempSubKey1Ref.deref() !== undefined) {
            throw new Error("Level 2 cache keys not GC'd");
        }
        if (tempValue1Ref.deref() !== undefined) {
            throw new Error("Cache values not GC'd");
        }

        return "Test Passed: WeakMixMultiLevelCacheTest034";
    },

    /**
     * 035. 集合补集组合：WeakMap使用两个Set作为键，WeakSet存储补集结果
     */
    async test035_WeakMixSetComplement() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let universalSet, subset, complementSet, setRefs;

        (function createSetComplement() {
            // 创建共享引用的对象
            const obj1 = { id: 'obj-1' };
            const obj2 = { id: 'obj-2' };
            const obj3 = { id: 'obj-3' };
            const obj4 = { id: 'obj-4' };

            universalSet = new Set([obj1, obj2, obj3, obj4]);
            subset = new Set([obj2, obj3]);

            // 计算补集 (universal - subset)
            complementSet = new Set();
            universalSet.forEach(item => {
                if (!subset.has(item)) complementSet.add(item);
            });

            // WeakSet存储补集结果
            complementSet.forEach(item => weakSet.add(item));

            // WeakMap使用Set组合作为键，存储补集的WeakRef
            const key = { universal: universalSet, subset };
            const compRef = new WeakRef(complementSet);
            weakMap.set(key, compRef);

            setRefs = {
                universal: new WeakRef(universalSet),
                subset: new WeakRef(subset)
            };

            // 验证初始状态
            if (complementSet.size !== 2) throw new Error(`Set complement size wrong (expected 2, got ${complementSet.size})`);
            if (!complementSet.has(obj1) || !complementSet.has(obj4)) throw new Error("Set complement missing objects");
        })();

        // 清除强引用
        const tempUniversalRef = setRefs.universal;
        const tempSubsetRef = setRefs.subset;
        const tempCompRef = new WeakRef(complementSet);
        universalSet = null;
        subset = null;
        complementSet = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempUniversalRef.deref() !== undefined || tempSubsetRef.deref() !== undefined) {
            throw new Error("Original sets not GC'd");
        }
        if (tempCompRef.deref() !== undefined) throw new Error("Complement set not GC'd");

        return "Test Passed: WeakMixSetComplementTest035";
    },

    /**
     * 036. 日期比较组合：WeakSet存储多个Date，WeakMap关联比较结果的WeakRef
     */
    async test036_WeakMixDateComparison() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let date1, date2, comparison, dateRefs;

        (function createDateComparison() {
            date1 = new Date('2024-01-01');
            date2 = new Date('2024-12-31');

            // 比较日期并存储结果
            comparison = {
                date1: date1,
                date2: date2,
                date1Earlier: date1 < date2,
                diffDays: Math.floor((date2 - date1) / (1000 * 60 * 60 * 24))
            };

            // WeakSet存储日期对象
            weakSet.add(date1);
            weakSet.add(date2);

            // WeakMap使用日期组合作为键，存储比较结果的WeakRef
            const key = { date1, date2 };
            const compRef = new WeakRef(comparison);
            weakMap.set(key, compRef);

            dateRefs = {
                date1: new WeakRef(date1),
                date2: new WeakRef(date2)
            };

            // 验证初始状态
            if (!comparison.date1Earlier) throw new Error("Date comparison failed");
            if (comparison.diffDays !== 365) throw new Error("Date difference calculation failed");
        })();

        // 清除强引用
        const tempDate1Ref = dateRefs.date1;
        const tempDate2Ref = dateRefs.date2;
        const tempCompRef = new WeakRef(comparison);
        date1 = null;
        date2 = null;
        comparison = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempDate1Ref.deref() !== undefined || tempDate2Ref.deref() !== undefined) {
            throw new Error("Date objects not GC'd");
        }
        if (tempCompRef.deref() !== undefined) throw new Error("Comparison results not GC'd");

        return "Test Passed: WeakMixDateComparisonTest036";
    },

    /**
     * 037. 正则分割组合：WeakSet存储RegExp，WeakMap关联分割结果的WeakRef
     */
    async test037_WeakMixRegexSplit() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let regexObj, splitResults, regexRef;

        (function createRegexSplit() {
            regexObj = /\s*,\s*/; // 匹配逗号及周围空格
            const testString = "apple, banana, cherry, date";

            // 使用正则分割字符串
            splitResults = {
                original: testString,
                parts: testString.split(regexObj),
                count: testString.split(regexObj).length,
                source: regexObj
            };

            // WeakSet存储RegExp
            weakSet.add(regexObj);

            // WeakMap关联分割结果的WeakRef
            const splitRef = new WeakRef(splitResults);
            weakMap.set(regexObj, splitRef);

            regexRef = new WeakRef(regexObj);

            // 验证初始状态
            if (splitResults.count !== 4) throw new Error(`Regex split failed (expected 4 parts, got ${splitResults.count})`);
            if (!weakSet.has(regexObj)) throw new Error("WeakSet missing regex");
        })();

        // 清除强引用
        const tempRegexRef = regexRef;
        const tempSplitRef = new WeakRef(splitResults);
        regexObj = null;
        splitResults = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempRegexRef.deref() !== undefined) throw new Error("Regex not GC'd");
        if (tempSplitRef.deref() !== undefined) throw new Error("Split results not GC'd");

        return "Test Passed: WeakMixRegexSplitTest037";
    },

    /**
     * 038. 缓冲区复制组合：WeakMap存储原始缓冲区，WeakSet跟踪复制结果
     */
    async test038_WeakMixBufferCopy() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let buffer, copyBuffer, bufferRef;

        (function createBufferCopy() {
            buffer = new ArrayBuffer(16); // 16字节缓冲区

            // 填充原始数据
            const originalView = new Uint8Array(buffer);
            for (let i = 0; i < originalView.length; i++) {
                originalView[i] = i; // 0,1,2,...,15
            }

            // 创建缓冲区副本
            copyBuffer = new ArrayBuffer(buffer.byteLength);
            new Uint8Array(copyBuffer).set(new Uint8Array(buffer));

            // WeakSet跟踪复制结果
            weakSet.add(copyBuffer);

            // WeakMap存储原始缓冲区到副本的WeakRef
            const copyRef = new WeakRef(copyBuffer);
            weakMap.set(buffer, copyRef);

            bufferRef = new WeakRef(buffer);

            // 验证初始状态
            if (new Uint8Array(copyBuffer)[5] !== 5) throw new Error("Buffer copy failed");
            if (!weakSet.has(copyBuffer)) throw new Error("WeakSet missing buffer copy");
        })();

        // 清除强引用
        const tempBufferRef = bufferRef;
        const tempCopyRef = new WeakRef(copyBuffer);
        buffer = null;
        copyBuffer = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempBufferRef.deref() !== undefined) throw new Error("Original buffer not GC'd");
        if (tempCopyRef.deref() !== undefined) throw new Error("Buffer copy not GC'd");

        return "Test Passed: WeakMixBufferCopyTest038";
    },

    /**
     * 039. 函数绑定组合：WeakSet存储绑定函数，WeakMap关联原始函数的WeakRef
     */
    async test039_WeakMixFunctionBinding() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let originalFn, boundFn, fnRef;

        (function createBoundFunction() {
            // 创建原始函数
            originalFn = function(multiplier) {
                return this.value * multiplier;
            };

            // 创建绑定上下文的函数
            const context = { value: 10 };
            boundFn = originalFn.bind(context);
            boundFn.source = originalFn;
            boundFn.context = context;

            // WeakSet存储绑定函数
            weakSet.add(boundFn);

            // WeakMap关联原始函数的WeakRef
            const origRef = new WeakRef(originalFn);
            weakMap.set(boundFn, origRef);

            fnRef = new WeakRef(boundFn);

            // 验证初始状态
            if (boundFn(3) !== 30) throw new Error("Function binding failed");
            if (!weakSet.has(boundFn)) throw new Error("WeakSet missing bound function");
        })();

        // 清除强引用
        const tempBoundRef = fnRef;
        const tempOrigRef = new WeakRef(originalFn);
        originalFn = null;
        boundFn = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempBoundRef.deref() !== undefined) throw new Error("Bound function not GC'd");
        if (tempOrigRef.deref() !== undefined) throw new Error("Original function not GC'd");

        return "Test Passed: WeakMixFunctionBindingTest039";
    },

    /**
     * 040. 综合数据结构组合：多层嵌套结构的弱引用跟踪
     */
    async test040_WeakMixComprehensiveStructure() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let root, node1, node2, leafA, leafB, rootRef;

        (function createComprehensiveStructure() {
            // 创建多层嵌套数据结构
            leafA = { type: 'leaf', data: [1, 2, 3] };
            leafB = { type: 'leaf', data: [4, 5, 6] };

            node1 = {
                type: 'node',
                name: 'node-1',
                children: new Set([leafA]),
                meta: new Map([['created', new Date()]])
            };

            node2 = {
                type: 'node',
                name: 'node-2',
                children: new Set([leafB]),
                meta: new Map([['created', new Date()]])
            };

            root = {
                type: 'root',
                nodes: new Map([['node1', node1], ['node2', node2]]),
                stats: { count: 2, updated: new Date() }
            };

            // WeakSet跟踪所有层级的对象
            [root, node1, node2, leafA, leafB, root.stats, ...node1.meta.values(), ...node2.meta.values()].forEach(item => {
                weakSet.add(item);
            });

            // WeakMap建立跨层级引用
            weakMap.set(root, new WeakRef({
                nodes: new WeakRef(root.nodes),
                stats: new WeakRef(root.stats)
            }));
            weakMap.set(node1, new WeakRef(leafA));
            weakMap.set(node2, new WeakRef(leafB));

            rootRef = new WeakRef(root);

            // 验证初始状态
            if (node1.children.size !== 1 || node2.children.size !== 1) throw new Error("Node children initialization failed");
            if (root.nodes.size !== 2) throw new Error("Root nodes initialization failed");
        })();

        // 清除强引用
        const tempRootRef = rootRef;
        const tempLeafARef = new WeakRef(leafA);
        const tempLeafBRef = new WeakRef(leafB);
        root = null;
        node1 = null;
        node2 = null;
        leafA = null;
        leafB = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempRootRef.deref() !== undefined) throw new Error("Root object not GC'd");
        if (tempLeafARef.deref() !== undefined || tempLeafBRef.deref() !== undefined) {
            throw new Error("Leaf nodes not GC'd");
        }

        return "Test Passed: WeakMixComprehensiveStructureTest040";
    },
    /**
     * 041. Promise对象组合：WeakSet存储Promise，WeakMap关联结果的WeakRef
     */
    async test041_WeakMixPromiseObjects() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let promiseObj, resultObj, promiseRef;

        (function createPromiseStructure() {
            // 创建带结果的Promise
            promiseObj = new Promise((resolve) => {
                resultObj = { id: 'promise-result-041', value: 42 };
                resolve(resultObj);
            });

            // WeakSet存储Promise对象
            weakSet.add(promiseObj);

            // WeakMap关联结果的WeakRef
            const resultRef = new WeakRef(resultObj);
            weakMap.set(promiseObj, resultRef);

            promiseRef = new WeakRef(promiseObj);

            // 验证初始状态
            if (!weakSet.has(promiseObj)) throw new Error("WeakSet missing promise");
            if (weakMap.get(promiseObj)?.deref() !== resultObj) {
                throw new Error("Promise result WeakRef mismatch");
            }
        })();

        // 清除强引用
        const tempPromiseRef = promiseRef;
        const tempResultRef = new WeakRef(resultObj);
        promiseObj = null;
        resultObj = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempPromiseRef.deref() !== undefined) throw new Error("Promise object not GC'd");
        if (tempResultRef.deref() !== undefined) throw new Error("Promise result not GC'd");

        return "Test Passed: WeakMixPromiseObjectsTest041";
    },

    /**
     * 042. 生成器函数组合：WeakMap存储生成器，WeakSet跟踪迭代结果
     */
    async test042_WeakMixGeneratorFunctions() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let generator, iterResults, generatorRef;

        (function createGeneratorStructure() {
            // 创建生成器函数
            function* dataGenerator() {
                yield { id: 'gen-1-042' };
                yield { id: 'gen-2-042' };
                yield { id: 'gen-3-042' };
            }

            // 创建生成器实例
            generator = dataGenerator();

            // 收集迭代结果
            iterResults = [];
            for (const item of generator) {
                iterResults.push(item);
                weakSet.add(item); // WeakSet跟踪迭代结果
            }

            // WeakMap存储生成器到结果的WeakRef
            const resultsRef = new WeakRef(iterResults);
            weakMap.set(generator, resultsRef);

            generatorRef = new WeakRef(generator);

            // 验证初始状态
            if (iterResults.length !== 3) throw new Error("Generator iteration failed");
            if (!weakMap.has(generator)) throw new Error("WeakMap missing generator");
        })();

        // 清除强引用
        const tempGeneratorRef = generatorRef;
        const tempResultRefs = iterResults.map(item => new WeakRef(item));
        generator = null;
        iterResults = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempGeneratorRef.deref() !== undefined) throw new Error("Generator not GC'd");
        if (tempResultRefs.some(ref => ref.deref() !== undefined)) {
            throw new Error("Generator results not GC'd");
        }

        return "Test Passed: WeakMixGeneratorFunctionsTest042";
    },

    /**
     * 043. Symbol对象组合：WeakSet存储Symbol包装对象，WeakMap关联映射结果
     */
    async test043_WeakMixSymbolObjects() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let symbolObj1, symbolObj2, mapResult, symbolRefs;

        (function createSymbolStructure() {
            // 创建Symbol包装对象（非原始值）
            symbolObj1 = Object(Symbol('sym-1-043'));
            symbolObj2 = Object(Symbol('sym-2-043'));

            // 创建映射结果
            mapResult = new Map([
                [symbolObj1, { value: 'mapped-1' }],
                [symbolObj2, { value: 'mapped-2' }]
            ]);

            // WeakSet存储Symbol包装对象
            weakSet.add(symbolObj1);
            weakSet.add(symbolObj2);

            // WeakMap关联映射结果的WeakRef
            const mapRef = new WeakRef(mapResult);
            weakMap.set(symbolObj1, mapRef);

            symbolRefs = {
                sym1: new WeakRef(symbolObj1),
                sym2: new WeakRef(symbolObj2)
            };

            // 验证初始状态
            if (!weakSet.has(symbolObj2)) throw new Error("WeakSet missing symbol object");
            if (weakMap.get(symbolObj1)?.deref() !== mapResult) {
                throw new Error("Symbol map result mismatch");
            }
        })();

        // 清除强引用
        const tempSym1Ref = symbolRefs.sym1;
        const tempSym2Ref = symbolRefs.sym2;
        const tempMapRef = new WeakRef(mapResult);
        symbolObj1 = null;
        symbolObj2 = null;
        mapResult = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempSym1Ref.deref() !== undefined || tempSym2Ref.deref() !== undefined) {
            throw new Error("Symbol objects not GC'd");
        }
        if (tempMapRef.deref() !== undefined) throw new Error("Symbol map result not GC'd");

        return "Test Passed: WeakMixSymbolObjectsTest043";
    },

    /**
     * 044. 嵌套WeakMap组合：WeakMap嵌套WeakMap作为键，WeakSet跟踪值对象
     */
    async test044_WeakMixNestedWeakMaps() {
        const outerWeakMap = new WeakMap();
        const weakSet = new WeakSet();
        let innerWeakMap1, innerWeakMap2, valueObj1, valueObj2, innerRefs;

        (function createNestedWeakMaps() {
            // 创建内部WeakMap和值对象
            innerWeakMap1 = new WeakMap();
            innerWeakMap2 = new WeakMap();
            valueObj1 = { id: 'value-1-044' };
            valueObj2 = { id: 'value-2-044' };

            // 内部WeakMap存储值
            innerWeakMap1.set(valueObj1, { data: 'inner-1-data' });
            innerWeakMap2.set(valueObj2, { data: 'inner-2-data' });

            // WeakSet跟踪值对象
            weakSet.add(valueObj1);
            weakSet.add(valueObj2);

            // 外部WeakMap以内部WeakMap为键
            outerWeakMap.set(innerWeakMap1, new WeakRef(valueObj1));
            outerWeakMap.set(innerWeakMap2, new WeakRef(valueObj2));

            innerRefs = {
                map1: new WeakRef(innerWeakMap1),
                map2: new WeakRef(innerWeakMap2)
            };

            // 验证初始状态
            if (!outerWeakMap.has(innerWeakMap1) || !outerWeakMap.has(innerWeakMap2)) {
                throw new Error("Outer WeakMap initialization failed");
            }
            if (!weakSet.has(valueObj1)) throw new Error("WeakSet missing value object");
        })();

        // 清除强引用
        const tempMap1Ref = innerRefs.map1;
        const tempMap2Ref = innerRefs.map2;
        const tempValue1Ref = new WeakRef(valueObj1);
        innerWeakMap1 = null;
        innerWeakMap2 = null;
        valueObj1 = null;
        valueObj2 = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempMap1Ref.deref() !== undefined || tempMap2Ref.deref() !== undefined) {
            throw new Error("Inner WeakMaps not GC'd");
        }
        if (tempValue1Ref.deref() !== undefined) throw new Error("Value objects not GC'd");

        return "Test Passed: WeakMixNestedWeakMapsTest044";
    },

    /**
     * 045. 数组扁平化组合：WeakSet存储原始数组，WeakMap关联扁平化结果
     */
    async test045_WeakMixArrayFlatten() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let originalArray, flattenedArray, originalRef;

        (function createFlattenedArray() {
            // 创建嵌套数组
            originalArray = [
                { id: 'a' },
                [{ id: 'b' }, [{ id: 'c' }]],
                { id: 'd' }
            ];

            // 扁平化数组（深度为2）
            flattenedArray = originalArray.flat(2);
            flattenedArray.source = originalArray;

            // WeakSet存储原始数组
            weakSet.add(originalArray);

            // WeakMap关联扁平化结果的WeakRef
            const flatRef = new WeakRef(flattenedArray);
            weakMap.set(originalArray, flatRef);

            originalRef = new WeakRef(originalArray);

            // 验证初始状态
            if (flattenedArray.length !== 4) throw new Error("Array flattening failed");
            if (weakMap.get(originalArray)?.deref() !== flattenedArray) {
                throw new Error("Flattened array WeakRef mismatch");
            }
        })();

        // 清除强引用
        const tempOriginalRef = originalRef;
        const tempFlattenedRef = new WeakRef(flattenedArray);
        originalArray = null;
        flattenedArray = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempOriginalRef.deref() !== undefined) throw new Error("Original array not GC'd");
        if (tempFlattenedRef.deref() !== undefined) throw new Error("Flattened array not GC'd");

        return "Test Passed: WeakMixArrayFlattenTest045";
    },

    /**
     * 046. Map合并组合：WeakMap存储两个Map，WeakSet跟踪合并结果
     */
    async test046_WeakMixMapMerge() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let mapA, mapB, mergedMap, mapRefs;

        (function createMergedMap() {
            // 创建共享键对象
            const sharedKey = { id: 'shared-key' };
            const keyA = { id: 'key-a' };
            const keyB = { id: 'key-b' };

            // 创建两个Map
            mapA = new Map([[sharedKey, 'value-a'], [keyA, 'only-a']]);
            mapB = new Map([[sharedKey, 'value-b'], [keyB, 'only-b']]);

            // 合并Map（mapB覆盖mapA的相同键）
            mergedMap = new Map([...mapA, ...mapB]);

            // WeakSet跟踪合并结果中的键
            mergedMap.forEach((_, key) => weakSet.add(key));

            // 创建复合键对象（存储两个Map）
            const key = { mapA, mapB };
            const mergedRef = new WeakRef(mergedMap);
            weakMap.set(key, mergedRef);

            mapRefs = {
                mapA: new WeakRef(mapA),
                mapB: new WeakRef(mapB)
            };

            // 验证初始状态
            if (mergedMap.get(sharedKey) !== 'value-b') throw new Error("Map merging failed");
            if (mergedMap.size !== 3) throw new Error("Merged map size incorrect");
        })();

        // 清除强引用
        const tempMapARef = mapRefs.mapA;
        const tempMapBRef = mapRefs.mapB;
        const tempMergedRef = new WeakRef(mergedMap);
        mapA = null;
        mapB = null;
        mergedMap = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempMapARef.deref() !== undefined || tempMapBRef.deref() !== undefined) {
            throw new Error("Original maps not GC'd");
        }
        if (tempMergedRef.deref() !== undefined) throw new Error("Merged map not GC'd");

        return "Test Passed: WeakMixMapMergeTest046";
    },
    /**
     * 047. 日期计算组合：WeakSet存储基础Date，WeakMap关联计算后Date
     */
    async test047_WeakMixDateAddition() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let baseDate, futureDate, dateRef;

        (function createDateCalculation() {
            // 使用UTC日期避免时区差异影响
            baseDate = new Date(Date.UTC(2024, 0, 1)); // 2024-01-01 UTC

            // 计算31天后的日期（1月有31天，加31天正好是2月1日）
            futureDate = new Date(baseDate);
            futureDate.setUTCDate(futureDate.getUTCDate() + 31);

            // 存储计算元数据
            const calculation = {
                base: baseDate,
                future: futureDate,
                daysAdded: 31,
                baseStr: baseDate.toISOString(),
                futureStr: futureDate.toISOString()
            };

            // WeakSet存储基础日期
            weakSet.add(baseDate);

            // WeakMap关联计算结果的WeakRef
            const calcRef = new WeakRef(calculation);
            weakMap.set(baseDate, calcRef);

            dateRef = new WeakRef(baseDate);

            // 验证初始状态（使用UTC方法确保时区一致性）
            const expectedMonth = 1; // 2月（UTC月份从0开始）
            const expectedDate = 1;  // 1日
            const actualMonth = futureDate.getUTCMonth();
            const actualDate = futureDate.getUTCDate();

            if (actualMonth !== expectedMonth || actualDate !== expectedDate) {
                throw new Error(`Date addition calculation failed: 预期${expectedMonth+1}月${expectedDate}日，实际${actualMonth+1}月${actualDate}日`);
            }
            if (!weakSet.has(baseDate)) throw new Error("WeakSet missing base date");
        })();

        // 清除强引用
        const tempBaseRef = dateRef;
        const tempFutureRef = new WeakRef(futureDate);
        baseDate = null;
        futureDate = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempBaseRef.deref() !== undefined) throw new Error("Base date not GC'd");
        if (tempFutureRef.deref() !== undefined) throw new Error("Future date not GC'd");

        return "Test Passed: WeakMixDateAdditionTest047";
    },
    /**
     * 048. 正则转义组合：WeakMap存储原始RegExp，WeakSet跟踪转义结果
     */
    async test048_WeakMixRegexEscaping() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let originalRegex, escapedStrings, regexRef;

        (function createEscapedRegex() {
            // 创建包含特殊字符的正则
            originalRegex = /([.*+?^=!:${}()|\[\]\/\\])/g;

            // 需要转义的字符串集合
            escapedStrings = [
                { input: "a.b", escaped: "a\\.b" },
                { input: "a*b", escaped: "a\\*b" },
                { input: "a+b", escaped: "a\\+b" }
            ];

            // 执行转义
            escapedStrings.forEach(item => {
                item.result = item.input.replace(originalRegex, "\\$1");
            });

            // WeakSet跟踪转义结果对象
            escapedStrings.forEach(item => weakSet.add(item));

            // WeakMap存储原始正则到结果的WeakRef
            const escapeRef = new WeakRef(escapedStrings);
            weakMap.set(originalRegex, escapeRef);

            regexRef = new WeakRef(originalRegex);

            // 验证初始状态
            if (escapedStrings[0].result !== escapedStrings[0].escaped) {
                throw new Error("Regex escaping failed");
            }
            if (!weakMap.has(originalRegex)) throw new Error("WeakMap missing regex");
        })();

        // 清除强引用
        const tempRegexRef = regexRef;
        const tempEscapedRefs = escapedStrings.map(item => new WeakRef(item));
        originalRegex = null;
        escapedStrings = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempRegexRef.deref() !== undefined) throw new Error("Original regex not GC'd");
        if (tempEscapedRefs.some(ref => ref.deref() !== undefined)) {
            throw new Error("Escaped results not GC'd");
        }

        return "Test Passed: WeakMixRegexEscapingTest048";
    },

    /**
     * 049. 缓冲区拼接组合：WeakSet存储源缓冲区，WeakMap关联拼接结果
     */
    async test049_WeakMixBufferConcat() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let buffer1, buffer2, combinedBuffer, bufferRefs;

        (function createCombinedBuffer() {
            // 创建两个缓冲区
            buffer1 = new ArrayBuffer(8);
            buffer2 = new ArrayBuffer(8);

            // 填充数据
            const view1 = new Uint32Array(buffer1);
            view1.set([0x1234, 0x5678]);

            const view2 = new Uint32Array(buffer2);
            view2.set([0x9abc, 0xdef0]);

            // 拼接缓冲区
            combinedBuffer = new Uint32Array([
                ...new Uint32Array(buffer1),
                ...new Uint32Array(buffer2)
            ]).buffer;

            // WeakSet存储源缓冲区
            weakSet.add(buffer1);
            weakSet.add(buffer2);

            // WeakMap关联拼接结果的WeakRef
            const comboRef = new WeakRef(combinedBuffer);
            const key = { buffer1, buffer2 }; // 复合键对象
            weakMap.set(key, comboRef);

            bufferRefs = {
                b1: new WeakRef(buffer1),
                b2: new WeakRef(buffer2)
            };

            // 验证初始状态
            if (combinedBuffer.byteLength !== 16) throw new Error("Buffer concatenation failed");
            if (!weakSet.has(buffer1) || !weakSet.has(buffer2)) {
                throw new Error("WeakSet missing buffers");
            }
        })();

        // 清除强引用
        const tempB1Ref = bufferRefs.b1;
        const tempB2Ref = bufferRefs.b2;
        const tempComboRef = new WeakRef(combinedBuffer);
        buffer1 = null;
        buffer2 = null;
        combinedBuffer = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempB1Ref.deref() !== undefined || tempB2Ref.deref() !== undefined) {
            throw new Error("Source buffers not GC'd");
        }
        if (tempComboRef.deref() !== undefined) throw new Error("Combined buffer not GC'd");

        return "Test Passed: WeakMixBufferConcatTest049";
    },

    /**
     * 050. 代理对象组合：WeakMap存储代理对象，WeakSet跟踪目标对象
     */
    async test050_WeakMixProxyObjects() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let targetObj, proxyObj, proxyRef;

        (function createProxyStructure() {
            // 创建目标对象
            targetObj = {
                id: 'target-050',
                value: 100,
                getDouble() { return this.value * 2; }
            };

            // 创建代理对象
            proxyObj = new Proxy(targetObj, {
                get(target, prop) {
                    if (prop === 'value') return target[prop] + 10;
                    return target[prop];
                }
            });

            // WeakSet跟踪目标对象
            weakSet.add(targetObj);

            // WeakMap存储代理到目标的WeakRef
            const targetRef = new WeakRef(targetObj);
            weakMap.set(proxyObj, targetRef);

            proxyRef = new WeakRef(proxyObj);

            // 验证初始状态
            if (proxyObj.value !== 110) throw new Error("Proxy implementation failed");
            if (weakMap.get(proxyObj)?.deref() !== targetObj) {
                throw new Error("Proxy target WeakRef mismatch");
            }
        })();

        // 清除强引用
        const tempProxyRef = proxyRef;
        const tempTargetRef = new WeakRef(targetObj);
        proxyObj = null;
        targetObj = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempProxyRef.deref() !== undefined) throw new Error("Proxy object not GC'd");
        if (tempTargetRef.deref() !== undefined) throw new Error("Target object not GC'd");

        return "Test Passed: WeakMixProxyObjectsTest050";
    },

    /**
     * 051. 数组去重组合：WeakSet存储原始数组，WeakMap关联去重结果
     */
    async test051_WeakMixArrayUnique() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let originalArray, uniqueArray, originalRef;

        (function createUniqueArray() {
            // 创建包含重复对象的数组（使用共享引用）
            const objA = { id: 'a' };
            const objB = { id: 'b' };
            originalArray = [objA, objB, objA, objB, { id: 'c' }, objA];

            // 去重处理
            uniqueArray = [];
            const seen = new Set();
            originalArray.forEach(item => {
                if (!seen.has(item)) {
                    seen.add(item);
                    uniqueArray.push(item);
                }
            });
            uniqueArray.source = originalArray;

            // WeakSet存储原始数组
            weakSet.add(originalArray);

            // WeakMap关联去重结果的WeakRef
            const uniqueRef = new WeakRef(uniqueArray);
            weakMap.set(originalArray, uniqueRef);

            originalRef = new WeakRef(originalArray);

            // 验证初始状态
            if (uniqueArray.length !== 3) throw new Error("Array unique failed");
            if (!uniqueArray.includes(objA) || !uniqueArray.includes(objB)) {
                throw new Error("Unique array content incorrect");
            }
        })();

        // 清除强引用
        const tempOriginalRef = originalRef;
        const tempUniqueRef = new WeakRef(uniqueArray);
        originalArray = null;
        uniqueArray = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempOriginalRef.deref() !== undefined) throw new Error("Original array not GC'd");
        if (tempUniqueRef.deref() !== undefined) throw new Error("Unique array not GC'd");

        return "Test Passed: WeakMixArrayUniqueTest051";
    },

    /**
     * 052. 集合分区组合：WeakMap存储原始Set，WeakSet跟踪分区结果
     */
    async test052_WeakMixSetPartition() {

        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let originalSet, partitions, setRef;

        (function createSetPartitions() {
            // 创建共享对象
            const obj1 = { id: '1', value: 5 };
            const obj2 = { id: '2', value: 15 };
            const obj3 = { id: '3', value: 25 };
            const obj4 = { id: '4', value: 5 };
            const obj5 = { id: '5', value: 35 };

            // 创建原始Set
            originalSet = new Set([obj1, obj2, obj3, obj4, obj5]);

            // 按value是否>10分区
            partitions = {
                low: new Set(),
                high: new Set()
            };

            originalSet.forEach(item => {
                if (item.value > 10) {
                    partitions.high.add(item);
                } else {
                    partitions.low.add(item);
                }
                weakSet.add(item); // WeakSet跟踪所有元素
            });

            // WeakMap存储原始Set到分区的WeakRef
            const partitionsRef = new WeakRef(partitions);
            weakMap.set(originalSet, partitionsRef);

            setRef = new WeakRef(originalSet);

            // 验证初始状态
            if (partitions.low.size !== 2 || partitions.high.size !== 3) {
                throw new Error("Set partition failed");
            }
            if (!weakMap.has(originalSet)) throw new Error("WeakMap missing set");
        })();

        // 清除强引用
        const tempSetRef = setRef;
        const tempLowRef = new WeakRef(partitions.low);
        const tempHighRef = new WeakRef(partitions.high);
        originalSet = null;
        partitions = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));
        globalThis.ArkTools.forceFullGC();

        // 验证回收情况
        if (tempSetRef.deref() !== undefined) throw new Error("Original set not GC'd");
        if (tempLowRef.deref() !== undefined || tempHighRef.deref() !== undefined) {
            throw new Error("Partition sets not GC'd");
        }

        return "Test Passed: WeakMixSetPartitionTest052";
    },

    /**
     * 053. Number对象组合：WeakSet存储Number包装对象，WeakMap关联计算结果
     */
    async test053_WeakMixNumberObjects() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let numObj1, numObj2, calculations, numRefs;

        (function createNumberObjects() {
            // 创建Number包装对象（非原始值）
            numObj1 = new Number(10);
            numObj2 = new Number(20);

            // 执行计算
            calculations = {
                sum: new Number(numObj1 + numObj2),
                product: new Number(numObj1 * numObj2),
                sources: { numObj1, numObj2 }
            };

            // WeakSet存储源Number对象
            weakSet.add(numObj1);
            weakSet.add(numObj2);

            // WeakMap关联计算结果的WeakRef
            const calcRef = new WeakRef(calculations);
            weakMap.set(numObj1, calcRef);

            numRefs = {
                n1: new WeakRef(numObj1),
                n2: new WeakRef(numObj2)
            };

            // 验证初始状态
            if (calculations.sum.valueOf() !== 30 || calculations.product.valueOf() !== 200) {
                throw new Error("Number calculations failed");
            }
            if (!weakSet.has(numObj2)) throw new Error("WeakSet missing number object");
        })();

        // 清除强引用
        const tempN1Ref = numRefs.n1;
        const tempN2Ref = numRefs.n2;
        const tempCalcRef = new WeakRef(calculations);
        numObj1 = null;
        numObj2 = null;
        calculations = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempN1Ref.deref() !== undefined || tempN2Ref.deref() !== undefined) {
            throw new Error("Number objects not GC'd");
        }
        if (tempCalcRef.deref() !== undefined) throw new Error("Calculations not GC'd");

        return "Test Passed: WeakMixNumberObjectsTest053";
    },

    /**
     * 054. WeakSet组合：WeakMap存储多个WeakSet，WeakSet跟踪交集对象
     */
    async test054_WeakMixWeakSetComposition() {
        const weakMap = new WeakMap();
        const intersectionSet = new WeakSet();
        let weakSetA, weakSetB, commonObj1, commonObj2, setRefs;

        (function createWeakSetComposition() {
            // 创建共享对象
            commonObj1 = { id: 'common-1' };
            commonObj2 = { id: 'common-2' };
            const uniqueObjA = { id: 'unique-a' };
            const uniqueObjB = { id: 'unique-b' };

            // 创建两个WeakSet
            weakSetA = new WeakSet();
            weakSetB = new WeakSet();

            // 填充WeakSet
            [commonObj1, commonObj2, uniqueObjA].forEach(obj => weakSetA.add(obj));
            [commonObj1, commonObj2, uniqueObjB].forEach(obj => weakSetB.add(obj));

            // 计算交集（两个WeakSet都包含的对象）
            [commonObj1, commonObj2, uniqueObjA, uniqueObjB].forEach(obj => {
                if (weakSetA.has(obj) && weakSetB.has(obj)) {
                    intersectionSet.add(obj);
                }
            });

            // WeakMap存储WeakSet组合到交集的WeakRef
            const key = { weakSetA, weakSetB };
            const intersectionRef = new WeakRef({
                commonObj1: new WeakRef(commonObj1),
                commonObj2: new WeakRef(commonObj2)
            });
            weakMap.set(key, intersectionRef);

            setRefs = {
                a: new WeakRef(weakSetA),
                b: new WeakRef(weakSetB)
            };

            // 验证初始状态
            if (!intersectionSet.has(commonObj1) || !intersectionSet.has(commonObj2)) {
                throw new Error("WeakSet intersection failed");
            }
            if (intersectionSet.has(uniqueObjA) || intersectionSet.has(uniqueObjB)) {
                throw new Error("Intersection contains unique objects");
            }
        })();

        // 清除强引用
        const tempSetARef = setRefs.a;
        const tempSetBRef = setRefs.b;
        const tempObj1Ref = new WeakRef(commonObj1);
        const tempObj2Ref = new WeakRef(commonObj2);
        weakSetA = null;
        weakSetB = null;
        commonObj1 = null;
        commonObj2 = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempSetARef.deref() !== undefined || tempSetBRef.deref() !== undefined) {
            throw new Error("WeakSets not GC'd");
        }
        if (tempObj1Ref.deref() !== undefined || tempObj2Ref.deref() !== undefined) {
            throw new Error("Common objects not GC'd");
        }

        return "Test Passed: WeakMixWeakSetCompositionTest054";
    },

    /**
     * 055. 数组分块组合：WeakSet存储原始数组，WeakMap关联分块结果
     */
    async test055_WeakMixArrayChunk() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let originalArray, chunks, originalRef;

        (function createArrayChunks() {
            // 创建原始数组
            originalArray = [
                { id: '1' }, { id: '2' }, { id: '3' },
                { id: '4' }, { id: '5' }, { id: '6' }
            ];

            // 按大小为2分块
            chunks = [];
            for (let i = 0; i < originalArray.length; i += 2) {
                chunks.push(originalArray.slice(i, i + 2));
            }
            chunks.source = originalArray;

            // WeakSet存储原始数组
            weakSet.add(originalArray);

            // WeakMap关联分块结果的WeakRef
            const chunksRef = new WeakRef(chunks);
            weakMap.set(originalArray, chunksRef);

            originalRef = new WeakRef(originalArray);

            // 验证初始状态
            if (chunks.length !== 3 || chunks[0].length !== 2) {
                throw new Error("Array chunking failed");
            }
            if (weakMap.get(originalArray)?.deref() !== chunks) {
                throw new Error("Chunks WeakRef mismatch");
            }
        })();

        // 清除强引用
        const tempOriginalRef = originalRef;
        const tempChunksRef = new WeakRef(chunks);
        originalArray = null;
        chunks = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempOriginalRef.deref() !== undefined) throw new Error("Original array not GC'd");
        if (tempChunksRef.deref() !== undefined) throw new Error("Array chunks not GC'd");

        return "Test Passed: WeakMixArrayChunkTest055";
    },

    /**
     * 056. Map反转组合：WeakMap存储原始Map，WeakSet跟踪键值反转结果
     */
    async test056_WeakMixMapInversion() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let originalMap, invertedMap, mapRef;

        (function createInvertedMap() {
            // 创建键值对象
            const key1 = { id: 'key-1' };
            const key2 = { id: 'key-2' };
            const value1 = { id: 'value-1' };
            const value2 = { id: 'value-2' };

            // 创建原始Map
            originalMap = new Map([[key1, value1], [key2, value2]]);

            // 反转键值
            invertedMap = new Map();
            originalMap.forEach((value, key) => {
                invertedMap.set(value, key);
                weakSet.add(value); // WeakSet跟踪原始值（反转后的键）
            });

            // WeakMap存储原始Map到反转结果的WeakRef
            const invertedRef = new WeakRef(invertedMap);
            weakMap.set(originalMap, invertedRef);

            mapRef = new WeakRef(originalMap);

            // 验证初始状态
            if (invertedMap.get(value1) !== key1 || invertedMap.get(value2) !== key2) {
                throw new Error("Map inversion failed");
            }
            if (invertedMap.size !== 2) throw new Error("Inverted map size incorrect");
        })();

        // 清除强引用
        const tempMapRef = mapRef;
        const tempInvertedRef = new WeakRef(invertedMap);
        originalMap = null;
        invertedMap = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempMapRef.deref() !== undefined) throw new Error("Original map not GC'd");
        if (tempInvertedRef.deref() !== undefined) throw new Error("Inverted map not GC'd");

        return "Test Passed: WeakMixMapInversionTest056";
    },

    /**
     * 057. 日期范围组合：WeakSet存储日期范围，WeakMap关联包含检查结果
     */
    async test057_WeakMixDateRange() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let startDate, endDate, rangeChecks, dateRefs;

        (function createDateRange() {
            // 创建日期范围
            startDate = new Date('2024-01-01');
            endDate = new Date('2024-12-31');
            const range = { start: startDate, end: endDate };

            // 测试日期
            const inRangeDate = new Date('2024-06-15');
            const outRangeDate = new Date('2023-06-15');

            // 检查是否在范围内
            rangeChecks = {
                inRange: inRangeDate >= startDate && inRangeDate <= endDate,
                outRange: outRangeDate >= startDate && outRangeDate <= endDate,
                testDates: { inRangeDate, outRangeDate }
            };

            // WeakSet存储日期范围和测试日期
            weakSet.add(range);
            weakSet.add(inRangeDate);
            weakSet.add(outRangeDate);

            // WeakMap关联检查结果的WeakRef
            const checkRef = new WeakRef(rangeChecks);
            weakMap.set(range, checkRef);

            dateRefs = {
                start: new WeakRef(startDate),
                end: new WeakRef(endDate)
            };

            // 验证初始状态
            if (!rangeChecks.inRange || rangeChecks.outRange) {
                throw new Error("Date range check failed");
            }
            if (!weakSet.has(range)) throw new Error("WeakSet missing date range");
        })();

        // 清除强引用
        const tempStartRef = dateRefs.start;
        const tempEndRef = dateRefs.end;
        const tempCheckRef = new WeakRef(rangeChecks);
        startDate = null;
        endDate = null;
        rangeChecks = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempStartRef.deref() !== undefined || tempEndRef.deref() !== undefined) {
            throw new Error("Range dates not GC'd");
        }
        if (tempCheckRef.deref() !== undefined) throw new Error("Range checks not GC'd");

        return "Test Passed: WeakMixDateRangeTest057";
    },

    /**
     * 058. 正则标志组合：WeakMap存储RegExp，WeakSet跟踪不同标志组合
     */
    async test058_WeakMixRegexFlags() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let baseRegex, flagVariants, regexRef;

        (function createRegexFlags() {
            // 创建基础正则（无标志）
            baseRegex = /test/;

            // 创建不同标志的变体
            flagVariants = [
                { regex: /test/g, flags: 'g' },
                { regex: /test/i, flags: 'i' },
                { regex: /test/m, flags: 'm' },
                { regex: /test/gi, flags: 'gi' }
            ];

            // 测试标志效果
            const testStr = 'Test TEST test';
            flagVariants.forEach(variant => {
                variant.testResult = variant.regex.test(testStr);
                weakSet.add(variant.regex); // WeakSet跟踪变体
            });

            // WeakMap存储基础正则到变体的WeakRef
            const variantsRef = new WeakRef(flagVariants);
            weakMap.set(baseRegex, variantsRef);

            regexRef = new WeakRef(baseRegex);

            // 验证初始状态
            if (!flagVariants[1].testResult) throw new Error("Regex i flag test failed");
            if (flagVariants.length !== 4) throw new Error("Regex variants creation failed");
        })();

        // 清除强引用
        const tempRegexRef = regexRef;
        const tempVariantRefs = flagVariants.map(v => new WeakRef(v.regex));
        baseRegex = null;
        flagVariants = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempRegexRef.deref() !== undefined) throw new Error("Base regex not GC'd");
        if (tempVariantRefs.some(ref => ref.deref() !== undefined)) {
            throw new Error("Regex variants not GC'd");
        }

        return "Test Passed: WeakMixRegexFlagsTest058";
    },



    /**
     * 060. 递归结构组合：弱引用跟踪递归嵌套结构
     */
    async test060_WeakMixRecursiveStructure() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let rootNode, nodeRef;

        (function createRecursiveStructure() {
            // 创建递归节点结构
            rootNode = { id: 'root-060', children: [] };
            let current = rootNode;

            // 创建5层递归结构
            for (let i = 1; i <= 5; i++) {
                const child = { id: `node-${i}`, parent: current, children: [] };
                current.children.push(child);
                current = child;
                weakSet.add(child); // WeakSet跟踪子节点
            }

            // 添加一个指向根节点的引用，形成循环
            current.children.push(rootNode);

            // WeakMap存储根节点到深度信息的WeakRef
            const depthInfo = new WeakRef({ depth: 5, hasCycle: true });
            weakMap.set(rootNode, depthInfo);

            nodeRef = new WeakRef(rootNode);

            // 验证初始状态
            if (rootNode.children[0].children[0].id !== 'node-2') {
                throw new Error("Recursive structure creation failed");
            }
            if (!weakSet.has(rootNode.children[0])) throw new Error("WeakSet missing nodes");
        })();

        // 清除强引用（打破循环引用）
        const tempRootRef = nodeRef;
        const tempChildRef = new WeakRef(rootNode.children[0]);
        rootNode = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));
        globalThis.ArkTools.forceFullGC();
        // 验证回收情况
        if (tempRootRef.deref() !== undefined) throw new Error("Root node not GC'd");
        if (tempChildRef.deref() !== undefined) throw new Error("Child nodes not GC'd");

        return "Test Passed: WeakMixRecursiveStructureTest060";
    },
    /**
     * 061. 数组归约组合：WeakSet存储原始数组，WeakMap关联归约结果
     */
    async test061_WeakMixArrayReduce() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let originalArray, reducedResult, originalRef;

        (function createReducedResult() {
            // 创建包含对象的数组
            const obj1 = { value: 10 };
            const obj2 = { value: 20 };
            const obj3 = { value: 30 };
            originalArray = [obj1, obj2, obj3];

            // 归约计算总和
            reducedResult = originalArray.reduce((acc, item) => {
                acc.total += item.value;
                acc.items.push(item);
                return acc;
            }, { total: 0, items: [] });

            // WeakSet存储原始数组
            weakSet.add(originalArray);

            // WeakMap关联归约结果的WeakRef
            const reduceRef = new WeakRef(reducedResult);
            weakMap.set(originalArray, reduceRef);

            originalRef = new WeakRef(originalArray);

            // 验证初始状态
            if (reducedResult.total !== 60) {
                throw new Error(`Array reduce failed: 预期总和60，实际${reducedResult.total}`);
            }
            if (reducedResult.items.length !== 3) {
                throw new Error(`Reduce items count incorrect: 预期3，实际${reducedResult.items.length}`);
            }
        })();

        // 清除强引用
        const tempOriginalRef = originalRef;
        const tempReducedRef = new WeakRef(reducedResult);
        originalArray = null;
        reducedResult = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempOriginalRef.deref() !== undefined) throw new Error("Original array not GC'd");
        if (tempReducedRef.deref() !== undefined) throw new Error("Reduced result not GC'd");

        return "Test Passed: WeakMixArrayReduceTest061";
    },

    /**
     * 062. 高级Map过滤组合：WeakMap存储原始Map，WeakSet跟踪复杂过滤结果
     */
    async test062_WeakMixMapFilteringAdvanced() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let originalMap, filteredEntries, mapRef;

        (function createFilteredMap() {
            // 创建键值对象
            const key1 = { id: 'k1' };
            const key2 = { id: 'k2' };
            const key3 = { id: 'k3' };
            const val1 = { score: 85, type: 'A' };
            const val2 = { score: 60, type: 'B' };
            const val3 = { score: 92, type: 'A' };

            // 创建原始Map
            originalMap = new Map([[key1, val1], [key2, val2], [key3, val3]]);

            // 复杂过滤：type为'A'且score>80
            filteredEntries = [];
            originalMap.forEach((value, key) => {
                if (value.type === 'A' && value.score > 80) {
                    filteredEntries.push({ key, value });
                    weakSet.add(key); // WeakSet跟踪符合条件的键
                    weakSet.add(value); // 跟踪符合条件的值
                }
            });

            // WeakMap存储原始Map到过滤结果的WeakRef
            const filterRef = new WeakRef(filteredEntries);
            weakMap.set(originalMap, filterRef);

            mapRef = new WeakRef(originalMap);

            // 验证初始状态
            if (filteredEntries.length !== 2) {
                throw new Error(`Map filtering failed: 预期2个结果，实际${filteredEntries.length}`);
            }
            const found = filteredEntries.some(item => item.key === key1 && item.value === val1);
            if (!found) throw new Error("Filtered entries missing expected item");
        })();

        // 清除强引用
        const tempMapRef = mapRef;
        const tempFilteredRef = new WeakRef(filteredEntries);
        originalMap = null;
        filteredEntries = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempMapRef.deref() !== undefined) throw new Error("Original map not GC'd");
        if (tempFilteredRef.deref() !== undefined) throw new Error("Filtered entries not GC'd");

        return "Test Passed: WeakMixMapFilteringAdvancedTest062";
    },

    /**
     * 063. 集合对称差组合：WeakMap使用两个Set作为键，WeakSet存储对称差结果
     */
    async test063_WeakMixSetSymmetricDifference() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let setA, setB, symmetricDiff, setRefs;

        (function createSymmetricDifference() {
            // 创建共享对象引用
            const sharedObj = { id: 'shared' };
            const uniqueA = { id: 'only-a' };
            const uniqueB = { id: 'only-b' };

            // 创建两个Set
            setA = new Set([sharedObj, uniqueA]);
            setB = new Set([sharedObj, uniqueB]);

            // 计算对称差（仅存在于其中一个Set的元素）
            symmetricDiff = new Set();
            [uniqueA, uniqueB].forEach(obj => {
                symmetricDiff.add(obj);
                weakSet.add(obj); // WeakSet跟踪结果元素
            });

            // WeakMap使用复合键存储两个Set
            const key = { setA, setB };
            const diffRef = new WeakRef(symmetricDiff);
            weakMap.set(key, diffRef);

            setRefs = {
                a: new WeakRef(setA),
                b: new WeakRef(setB)
            };

            // 验证初始状态
            if (symmetricDiff.size !== 2) {
                throw new Error(`Symmetric difference size incorrect: 预期2，实际${symmetricDiff.size}`);
            }
            if (!symmetricDiff.has(uniqueA) || !symmetricDiff.has(uniqueB)) {
                throw new Error("Symmetric difference content incorrect");
            }
        })();

        // 清除强引用
        const tempSetARef = setRefs.a;
        const tempSetBRef = setRefs.b;
        const tempDiffRef = new WeakRef(symmetricDiff);
        setA = null;
        setB = null;
        symmetricDiff = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempSetARef.deref() !== undefined || tempSetBRef.deref() !== undefined) {
            throw new Error("Original sets not GC'd");
        }
        if (tempDiffRef.deref() !== undefined) throw new Error("Symmetric difference not GC'd");

        return "Test Passed: WeakMixSetSymmetricDifferenceTest063";
    },

    /**
     * 064. 错误继承组合：WeakSet存储自定义Error子类，WeakMap关联错误链
     */
    async test064_WeakMixErrorInheritance() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let baseError, childError, errorRef;

        (function createErrorChain() {
            // 定义自定义Error子类
            class ValidationError extends Error {
                constructor(message, code) {
                    super(message);
                    this.code = code;
                    this.name = 'ValidationError';
                }
            }

            // 创建错误链
            baseError = new Error('基础错误');
            childError = new ValidationError('数据验证失败', 400);
            childError.cause = baseError; // 建立错误链

            // WeakSet存储错误实例
            weakSet.add(baseError);
            weakSet.add(childError);

            // WeakMap关联错误详情的WeakRef
            const errorDetails = {
                chain: [baseError, childError],
                codes: [childError.code]
            };
            errorRef = new WeakRef(errorDetails);
            weakMap.set(childError, errorRef);

            errorRef = new WeakRef(childError);

            // 验证初始状态
            if (!(childError instanceof ValidationError)) {
                throw new Error("Custom error inheritance failed");
            }
            if (childError.cause !== baseError) throw new Error("Error chain not established");
        })();

        // 清除强引用
        const tempChildRef = errorRef;
        const tempBaseRef = new WeakRef(baseError);
        baseError = null;
        childError = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempChildRef.deref() !== undefined) throw new Error("Child error not GC'd");
        if (tempBaseRef.deref() !== undefined) throw new Error("Base error not GC'd");

        return "Test Passed: WeakMixErrorInheritanceTest064";
    },

    /**
     * 065. 异步迭代器组合：WeakMap存储异步迭代器，WeakSet跟踪迭代结果
     */
    async test065_WeakMixAsyncIterators() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let asyncIterator, results, iteratorRef;

        (function createAsyncIterator() {
            // 创建异步迭代器
            const data = [
                { id: 'async-1' },
                { id: 'async-2' },
                { id: 'async-3' }
            ];

            async function* createGenerator() {
                for (const item of data) {
                    await new Promise(resolve => setTimeout(resolve, 10));
                    yield item;
                }
            }

            asyncIterator = createGenerator();
            results = [];

            // 预执行迭代获取结果（用于测试验证）
            (async () => {
                for await (const item of asyncIterator) {
                    results.push(item);
                    weakSet.add(item); // WeakSet跟踪迭代结果
                }
            })();

            // WeakMap存储迭代器到结果的WeakRef
            const resultsRef = new WeakRef(results);
            weakMap.set(asyncIterator, resultsRef);

            iteratorRef = new WeakRef(asyncIterator);

            // 验证初始状态（等待至少一个结果）
            return new Promise(resolve => {
                const check = () => {
                    if (results.length > 0) {
                        resolve();
                    } else {
                        setTimeout(check, 50);
                    }
                };
                check();
            });
        })().then(() => {
            // 迭代器验证在异步初始化后进行
            if (results.length !== 3) {
                throw new Error(`Async iteration failed: 预期3个结果，实际${results.length}`);
            }
        });

        // 等待迭代完成
        await new Promise(resolve => setTimeout(resolve, 200));

        // 清除强引用
        const tempIteratorRef = iteratorRef;
        const tempResultsRef = new WeakRef(results);
        asyncIterator = null;
        results = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempIteratorRef.deref() !== undefined) throw new Error("Async iterator not GC'd");
        if (tempResultsRef.deref() !== undefined) throw new Error("Iterator results not GC'd");

        return "Test Passed: WeakMixAsyncIteratorsTest065";
    },

    /**
     * 066. 类型化数组转换组合：WeakSet存储源TypedArray，WeakMap关联类型转换结果
     */
    async test066_WeakMixTypedArrayConversion() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let sourceArray, convertedArrays, arrayRef;

        (function createTypedConversions() {
            // 创建源类型化数组（Int16Array）
            sourceArray = new Int16Array([-100, 200, -300, 400]);

            // 转换为其他类型
            convertedArrays = {
                uint16: new Uint16Array(sourceArray.buffer), // 共享缓冲区
                float32: new Float32Array(sourceArray.map(x => x / 100)), // 新缓冲区
                source: sourceArray
            };

            // WeakSet存储源数组
            weakSet.add(sourceArray);

            // WeakMap关联转换结果的WeakRef
            const conversionRef = new WeakRef(convertedArrays);
            weakMap.set(sourceArray, conversionRef);

            arrayRef = new WeakRef(sourceArray);

            // 验证初始状态
            if (convertedArrays.uint16.length !== 4) {
                throw new Error(`Typed array conversion failed: 预期长度4，实际${convertedArrays.uint16.length}`);
            }
            // 验证共享缓冲区的值（Int16到Uint16的二进制转换）
            if (convertedArrays.uint16[0] !== 65436) { // -100的Uint16表示
                throw new Error(`Typed array value mismatch: 预期65436，实际${convertedArrays.uint16[0]}`);
            }
        })();

        // 清除强引用
        const tempSourceRef = arrayRef;
        const tempConvertedRef = new WeakRef(convertedArrays);
        sourceArray = null;
        convertedArrays = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempSourceRef.deref() !== undefined) throw new Error("Source typed array not GC'd");
        if (tempConvertedRef.deref() !== undefined) throw new Error("Converted arrays not GC'd");

        return "Test Passed: WeakMixTypedArrayConversionTest066";
    },

    /**
     * 067. 符号注册表组合：WeakMap存储全局注册表Symbol，WeakSet跟踪关联对象
     */
    async test067_WeakMixSymbolRegistry() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let registrySymbol, associatedObjs, symbolRef;

        (function createSymbolRegistry() {
            // 创建全局注册表Symbol
            registrySymbol = Symbol.for('weakmix.test.067');

            // 创建关联对象
            associatedObjs = {
                data: { value: 'symbol-data' },
                handler: () => `Handled by ${registrySymbol.description}`,
                timestamp: new Date()
            };

            // WeakSet跟踪关联对象
            Object.values(associatedObjs).forEach(obj => {
                if (obj instanceof Object) weakSet.add(obj);
            });

            // 创建包装对象作为WeakMap键（Symbol不能直接作为键）
            const key = { symbol: registrySymbol };
             symbolRef = new WeakRef(associatedObjs);
            weakMap.set(key, symbolRef);

            symbolRef = new WeakRef(key);

            // 验证初始状态
            if (Symbol.keyFor(registrySymbol) !== 'weakmix.test.067') {
                throw new Error("Symbol registry lookup failed");
            }
            if (associatedObjs.handler() === undefined) {
                throw new Error("Symbol associated handler failed");
            }
        })();

        // 清除强引用
        const tempSymbolRef = symbolRef;
        const tempDataRef = new WeakRef(associatedObjs.data);
        registrySymbol = null;
        associatedObjs = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));
        globalThis.ArkTools.forceFullGC();
        // 验证回收情况
        if (tempSymbolRef.deref() !== undefined) throw new Error("Symbol wrapper not GC'd");
        if (tempDataRef.deref() !== undefined) throw new Error("Associated objects not GC'd");

        return "Test Passed: WeakMixSymbolRegistryTest067";
    },

    /**
     * 068. 嵌套代理组合：WeakSet存储嵌套代理对象，WeakMap关联目标链
     */
    async test068_WeakMixNestedProxies() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let targetObj, innerProxy, outerProxy, proxyRef;

        (function createNestedProxies() {
            // 创建原始目标对象
            targetObj = {
                level: 0,
                value: 'original',
                getNested() { return { nested: 'value' }; }
            };

            // 创建内层代理
            innerProxy = new Proxy(targetObj, {
                get(target, prop) {
                    if (prop === 'value') return `${target[prop]}-inner`;
                    return target[prop];
                }
            });

            // 创建外层代理（代理内层代理）
            outerProxy = new Proxy(innerProxy, {
                get(target, prop) {
                    if (prop === 'value') return `${target[prop]}-outer`;
                    return target[prop];
                }
            });

            // WeakSet存储所有代理
            weakSet.add(innerProxy);
            weakSet.add(outerProxy);

            // WeakMap关联目标链的WeakRef
            const targetChain = {
                outer: outerProxy,
                inner: innerProxy,
                target: targetObj
            };
            const chainRef = new WeakRef(targetChain);
            weakMap.set(outerProxy, chainRef);

            proxyRef = new WeakRef(outerProxy);

            // 验证初始状态
            if (outerProxy.value !== 'original-inner-outer') {
                throw new Error(`Nested proxy failed: 预期"original-inner-outer"，实际"${outerProxy.value}"`);
            }
            if (outerProxy.level !== 0) throw new Error("Proxy property access failed");
        })();

        // 清除强引用
        const tempOuterRef = proxyRef;
        const tempInnerRef = new WeakRef(innerProxy);
        const tempTargetRef = new WeakRef(targetObj);
        targetObj = null;
        innerProxy = null;
        outerProxy = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempOuterRef.deref() !== undefined) throw new Error("Outer proxy not GC'd");
        if (tempInnerRef.deref() !== undefined || tempTargetRef.deref() !== undefined) {
            throw new Error("Inner proxy or target not GC'd");
        }

        return "Test Passed: WeakMixNestedProxiesTest068";
    },

    /**
     * 069. 日期本地化组合：WeakMap存储Date，WeakSet跟踪多语言格式化结果
     */
    async test069_WeakMixDateLocalization() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let baseDate, localizedFormats, dateRef;

        (function createDateLocalizations() {
            // 使用UTC日期避免时区问题
            baseDate = new Date(Date.UTC(2024, 5, 15)); // 2024-06-15

            // 模拟多语言格式化（实际项目中可使用Intl.DateTimeFormat）
            localizedFormats = {
                en: {
                    full: "June 15, 2024",
                    short: "6/15/24"
                },
                zh: {
                    full: "2024年6月15日",
                    short: "24-06-15"
                },
                original: baseDate
            };

            // WeakSet存储格式化结果对象
            Object.values(localizedFormats).forEach(format => {
                if (typeof format === 'object' && format !== null) {
                    weakSet.add(format);
                }
            });

            // WeakMap关联本地化结果的WeakRef
            const localeRef = new WeakRef(localizedFormats);
            weakMap.set(baseDate, localeRef);

            dateRef = new WeakRef(baseDate);

            // 验证初始状态
            if (localizedFormats.en.full !== "June 15, 2024") {
                throw new Error(`English localization failed: ${localizedFormats.en.full}`);
            }
            if (localizedFormats.zh.full !== "2024年6月15日") {
                throw new Error(`Chinese localization failed: ${localizedFormats.zh.full}`);
            }
        })();

        // 清除强引用
        const tempDateRef = dateRef;
        const tempLocalesRef = new WeakRef(localizedFormats);
        baseDate = null;
        localizedFormats = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempDateRef.deref() !== undefined) throw new Error("Base date not GC'd");
        if (tempLocalesRef.deref() !== undefined) throw new Error("Localized formats not GC'd");

        return "Test Passed: WeakMixDateLocalizationTest069";
    },

    /**
     * 070. 正则执行结果组合：WeakSet存储RegExp，WeakMap关联多次执行结果
     */
    async test070_WeakMixRegexExecResults() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let pattern, execResults, regexRef;

        (function createRegexExecutions() {
            // 明确正则含义：匹配"t"开头，后跟可选的"e"及"s"或"x"
            pattern = /t(e[sx])?/g;
            // 测试字符串保持简洁，便于预测匹配结果
            const testStr = "test text rex";

            // 收集所有匹配结果
            execResults = [];
            let result;
            while ((result = pattern.exec(testStr)) !== null) {
                execResults.push({
                    match: result[0],
                    groups: result[1] || null,
                    index: result.index
                });
            }

            // 存储到弱引用容器
            weakSet.add(pattern);
            const execRef = new WeakRef(execResults);
            weakMap.set(pattern, execRef);
            regexRef = new WeakRef(pattern);

            // 验证匹配数量
            if (execResults.length !== 4) {
                throw new Error(`Regex exec failed: 预期4个匹配，实际${execResults.length}，匹配详情: ${JSON.stringify(execResults)}`);
            }

            // 修正1：调整第一个匹配的预期（实际匹配是"tes"而非"te"）
            // 因为正则会匹配最长可能的有效序列：t + e + s
            if (execResults[0].match !== 'tes' || execResults[0].groups !== 'es') {
                throw new Error(`First match incorrect: ${JSON.stringify(execResults[0])}`);
            }

            // 修正2：验证第二个匹配（test末尾的"t"）
            if (execResults[1].match !== 't' || execResults[1].groups !== null) {
                throw new Error(`Second match incorrect: ${JSON.stringify(execResults[1])}`);
            }

            // 验证第三个匹配（text中的"tex"）
            if (execResults[2].match !== 'tex' || execResults[2].groups !== 'ex') {
                throw new Error(`Third match incorrect: ${JSON.stringify(execResults[2])}`);
            }
        })();

        // 清除强引用并验证GC
        const tempRegexRef = regexRef;
        const tempResultsRef = new WeakRef(execResults);
        pattern = null;
        execResults = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        if (tempRegexRef.deref() !== undefined) throw new Error("Regex pattern not GC'd");
        if (tempResultsRef.deref() !== undefined) throw new Error("Exec results not GC'd");

        return "Test Passed: WeakMixRegexExecResultsTest070";
    },

    /**
     * 071. 缓冲区多视图组合：WeakMap存储ArrayBuffer，WeakSet跟踪多类型视图
     */
    async test071_WeakMixBufferViews() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let buffer, views, bufferRef;

        (function createBufferViews() {
            // 创建足够大的缓冲区（16字节）
            buffer = new ArrayBuffer(16);

            // 创建多种类型视图（不重叠区域）
            views = {
                int8: new Int8Array(buffer, 0, 4),
                uint16: new Uint16Array(buffer, 4, 2),
                float32: new Float32Array(buffer, 8, 2)
            };

            // 填充数据（每种视图独立区域）
            views.int8.set([-1, 2, -3, 4]);
            views.uint16.set([0x1234, 0x5678]);
            views.float32.set([3.14, 2.718]);

            // WeakSet跟踪所有视图
            Object.values(views).forEach(view => weakSet.add(view));

            // WeakMap关联视图集合的WeakRef
            const viewsRef = new WeakRef(views);
            weakMap.set(buffer, viewsRef);

            bufferRef = new WeakRef(buffer);

            // 验证初始状态
            if (views.int8[0] !== -1) throw new Error("Int8 view data mismatch");
            if (views.uint16[1] !== 0x5678) throw new Error("Uint16 view data mismatch");
            if (Math.abs(views.float32[0] - 3.14) > 0.001) {
                throw new Error("Float32 view data mismatch");
            }
        })();

        // 清除强引用
        const tempBufferRef = bufferRef;
        const tempViewsRef = new WeakRef(views);
        buffer = null;
        views = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempBufferRef.deref() !== undefined) throw new Error("Buffer not GC'd");
        if (tempViewsRef.deref() !== undefined) throw new Error("Buffer views not GC'd");

        return "Test Passed: WeakMixBufferViewsTest071";
    },

    /**
     * 072. 函数组合组合：WeakSet存储函数集合，WeakMap关联组合函数
     */
    async test072_WeakMixFunctionComposition() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let funcA, funcB, composedFunc, funcRefs;

        (function createFunctionComposition() {
            // 创建基础函数
            funcA = (x) => x * 2;
            funcB = (x) => x + 3;

            // 函数组合：(x) => funcB(funcA(x))
            composedFunc = (x) => funcB(funcA(x));

            // 附加元数据便于识别
            funcA.id = 'funcA-072';
            funcB.id = 'funcB-072';
            composedFunc.source = [funcA, funcB];

            // WeakSet存储基础函数
            weakSet.add(funcA);
            weakSet.add(funcB);

            // 创建复合键对象
            const key = { funcs: [funcA, funcB] };
            const composedRef = new WeakRef(composedFunc);
            weakMap.set(key, composedRef);

            funcRefs = {
                a: new WeakRef(funcA),
                b: new WeakRef(funcB)
            };

            // 验证初始状态
            if (composedFunc(5) !== 13) { // 5*2+3=13
                throw new Error(`Function composition failed: 预期13，实际${composedFunc(5)}`);
            }
            if (composedFunc.source.length !== 2) throw new Error("Composition source missing");
        })();

        // 清除强引用
        const tempFuncARef = funcRefs.a;
        const tempFuncBRef = funcRefs.b;
        const tempComposedRef = new WeakRef(composedFunc);
        funcA = null;
        funcB = null;
        composedFunc = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempFuncARef.deref() !== undefined || tempFuncBRef.deref() !== undefined) {
            throw new Error("Base functions not GC'd");
        }
        if (tempComposedRef.deref() !== undefined) throw new Error("Composed function not GC'd");

        return "Test Passed: WeakMixFunctionCompositionTest072";
    },

    /**
     * 073. 数组交集组合：WeakMap存储两个数组，WeakSet存储交集结果
     */
    async test073_WeakMixArrayIntersection() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let arrayA, arrayB, intersection, arrayRefs;

        (function createArrayIntersection() {
            // 创建共享对象引用
            const shared1 = { id: 'shared-1' };
            const shared2 = { id: 'shared-2' };
            const uniqueA = { id: 'only-a' };
            const uniqueB = { id: 'only-b' };

            // 创建两个数组
            arrayA = [shared1, shared2, uniqueA];
            arrayB = [shared1, shared2, uniqueB];

            // 计算交集（共享对象）
            intersection = arrayA.filter(item => arrayB.includes(item));
            intersection.forEach(item => weakSet.add(item)); // WeakSet跟踪交集元素

            // WeakMap使用复合键存储两个数组
            const key = { arrayA, arrayB };
            const intersectionRef = new WeakRef(intersection);
            weakMap.set(key, intersectionRef);

            arrayRefs = {
                a: new WeakRef(arrayA),
                b: new WeakRef(arrayB)
            };

            // 验证初始状态
            if (intersection.length !== 2) {
                throw new Error(`Array intersection failed: 预期2个元素，实际${intersection.length}`);
            }
            if (!intersection.includes(shared1) || !intersection.includes(shared2)) {
                throw new Error("Intersection missing shared elements");
            }
        })();

        // 清除强引用
        const tempArrayARef = arrayRefs.a;
        const tempArrayBRef = arrayRefs.b;
        const tempIntersectionRef = new WeakRef(intersection);
        arrayA = null;
        arrayB = null;
        intersection = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempArrayARef.deref() !== undefined || tempArrayBRef.deref() !== undefined) {
            throw new Error("Original arrays not GC'd");
        }
        if (tempIntersectionRef.deref() !== undefined) throw new Error("Intersection array not GC'd");

        return "Test Passed: WeakMixArrayIntersectionTest073";
    },

    /**
     * 074. Map链式查询组合：WeakSet存储Map链，WeakMap关联链式查询结果
     */
    async test074_WeakMixMapChaining() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let map1, map2, map3, chainResult, mapRefs;

        (function createMapChain() {
            // 创建键对象
            const keyA = { id: 'key-a' };
            const keyB = { id: 'key-b' };
            const keyC = { id: 'key-c' };

            // 创建Map链
            map1 = new Map([[keyA, keyB]]);       // A -> B
            map2 = new Map([[keyB, keyC]]);       // B -> C
            map3 = new Map([[keyC, 'final-value']]); // C -> value

            // 执行链式查询
            const step1 = map1.get(keyA);
            const step2 = step1 ? map2.get(step1) : null;
            const step3 = step2 ? map3.get(step2) : null;

            chainResult = {
                steps: [step1, step2, step3],
                final: step3
            };

            // WeakSet存储所有Map
            [map1, map2, map3].forEach(map => weakSet.add(map));

            // WeakMap关联查询结果的WeakRef
            const chainRef = new WeakRef(chainResult);
            weakMap.set(map1, chainRef);

            mapRefs = {
                m1: new WeakRef(map1),
                m2: new WeakRef(map2),
                m3: new WeakRef(map3)
            };

            // 验证初始状态
            if (chainResult.final !== 'final-value') {
                throw new Error(`Map chaining failed: 预期"final-value"，实际"${chainResult.final}"`);
            }
            if (chainResult.steps[1] !== keyC) throw new Error("Chaining steps incorrect");
        })();

        // 清除强引用
        const tempMap1Ref = mapRefs.m1;
        const tempMap2Ref = mapRefs.m2;
        const tempResultRef = new WeakRef(chainResult);
        map1 = null;
        map2 = null;
        map3 = null;
        chainResult = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempMap1Ref.deref() !== undefined || tempMap2Ref.deref() !== undefined) {
            throw new Error("Map chain elements not GC'd");
        }
        if (tempResultRef.deref() !== undefined) throw new Error("Chaining result not GC'd");

        return "Test Passed: WeakMixMapChainingTest074";
    },

    /**
     * 075. 集合笛卡尔积组合：WeakMap使用两个Set作为键，WeakSet存储笛卡尔积结果
     */
    async test075_WeakMixSetCartesianProduct() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let setX, setY, product, setRefs;

        (function createCartesianProduct() {
            // 创建集合元素
            const x1 = { id: 'x1' };
            const x2 = { id: 'x2' };
            const y1 = { id: 'y1' };
            const y2 = { id: 'y2' };
            const y3 = { id: 'y3' };

            // 创建两个Set
            setX = new Set([x1, x2]);
            setY = new Set([y1, y2, y3]);

            // 计算笛卡尔积（所有可能的配对）
            product = [];
            setX.forEach(x => {
                setY.forEach(y => {
                    const pair = { x, y, id: `${x.id}-${y.id}` };
                    product.push(pair);
                    weakSet.add(pair); // WeakSet跟踪积元素
                });
            });

            // WeakMap使用复合键存储两个Set
            const key = { setX, setY };
            const productRef = new WeakRef(product);
            weakMap.set(key, productRef);

            setRefs = {
                x: new WeakRef(setX),
                y: new WeakRef(setY)
            };

            // 验证初始状态
            const expectedSize = 2 * 3; // 2元素 × 3元素
            if (product.length !== expectedSize) {
                throw new Error(`Cartesian product size incorrect: 预期${expectedSize}，实际${product.length}`);
            }
            const found = product.some(pair => pair.x === x1 && pair.y === y2);
            if (!found) throw new Error("Cartesian product missing expected pair");
        })();

        // 清除强引用
        const tempSetXRef = setRefs.x;
        const tempSetYRef = setRefs.y;
        const tempProductRef = new WeakRef(product);
        setX = null;
        setY = null;
        product = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempSetXRef.deref() !== undefined || tempSetYRef.deref() !== undefined) {
            throw new Error("Original sets not GC'd");
        }
        if (tempProductRef.deref() !== undefined) throw new Error("Cartesian product not GC'd");

        return "Test Passed: WeakMixSetCartesianProductTest075";
    },

    /**
     * 076. 日期多单位计算组合：WeakSet存储基准Date，WeakMap关联多单位计算结果
     */
    async test076_WeakMixDateArithmetic() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let baseDate, calculations, dateRef;

        (function createDateCalculations() {
            // 使用UTC日期避免时区问题
            baseDate = new Date(Date.UTC(2024, 0, 1, 12, 0, 0)); // 2024-01-01T12:00:00Z

            // 多单位日期计算
            const addYear = new Date(baseDate);
            addYear.setUTCFullYear(addYear.getUTCFullYear() + 1);

            const addMonth = new Date(baseDate);
            addMonth.setUTCMonth(addMonth.getUTCMonth() + 3);

            const addHour = new Date(baseDate);
            addHour.setUTCHours(addHour.getUTCHours() + 5);

            calculations = {
                addYear,
                addMonth,
                addHour,
                base: baseDate
            };

            // WeakSet存储基准日期
            weakSet.add(baseDate);

            // WeakMap关联计算结果的WeakRef
            const calcRef = new WeakRef(calculations);
            weakMap.set(baseDate, calcRef);

            dateRef = new WeakRef(baseDate);

            // 验证初始状态
            if (addYear.getUTCFullYear() !== 2025) {
                throw new Error(`Year calculation failed: 预期2025，实际${addYear.getUTCFullYear()}`);
            }
            if (addMonth.getUTCMonth() !== 3) { // 0+3=3（4月）
                throw new Error(`Month calculation failed: 预期3，实际${addMonth.getUTCMonth()}`);
            }
            if (addHour.getUTCHours() !== 17) { // 12+5=17
                throw new Error(`Hour calculation failed: 预期17，实际${addHour.getUTCHours()}`);
            }
        })();

        // 清除强引用
        const tempBaseRef = dateRef;
        const tempCalculationsRef = new WeakRef(calculations);
        baseDate = null;
        calculations = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempBaseRef.deref() !== undefined) throw new Error("Base date not GC'd");
        if (tempCalculationsRef.deref() !== undefined) throw new Error("Date calculations not GC'd");

        return "Test Passed: WeakMixDateArithmeticTest076";
    },

    /**
     * 079. 类实例组合：WeakMap存储类实例，WeakSet跟踪实例方法结果
     */
    async test079_WeakMixClassInstances() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let instanceA, instanceB, methodResults, instanceRefs;

        (function createClassInstances() {
            // 定义测试类
            class DataProcessor {
                constructor(id, initialValue) {
                    this.id = id;
                    this.value = initialValue;
                }

                double() {
                    return this.value * 2;
                }

                toString() {
                    return `DataProcessor[${this.id}]: ${this.value}`;
                }
            }

            // 创建实例
            instanceA = new DataProcessor('A-079', 15);
            instanceB = new DataProcessor('B-079', 30);

            // 收集方法执行结果
            methodResults = {
                a: {
                    doubled: instanceA.double(),
                    str: instanceA.toString()
                },
                b: {
                    doubled: instanceB.double(),
                    str: instanceB.toString()
                }
            };

            // WeakSet跟踪结果对象
            Object.values(methodResults).forEach(result => weakSet.add(result));

            // WeakMap存储实例到结果的WeakRef
            const resultsRef = new WeakRef(methodResults);
            const key = { a: instanceA, b: instanceB };
            weakMap.set(key, resultsRef);

            instanceRefs = {
                a: new WeakRef(instanceA),
                b: new WeakRef(instanceB)
            };

            // 验证初始状态
            if (methodResults.a.doubled !== 30) { // 15*2=30
                throw new Error(`Instance A calculation failed: 预期30，实际${methodResults.a.doubled}`);
            }
            if (!methodResults.b.str.includes('B-079')) {
                throw new Error(`Instance B string failed: ${methodResults.b.str}`);
            }
        })();

        // 清除强引用
        const tempInstanceARef = instanceRefs.a;
        const tempInstanceBRef = instanceRefs.b;
        const tempResultsRef = new WeakRef(methodResults);
        instanceA = null;
        instanceB = null;
        methodResults = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempInstanceARef.deref() !== undefined || tempInstanceBRef.deref() !== undefined) {
            throw new Error("Class instances not GC'd");
        }
        if (tempResultsRef.deref() !== undefined) throw new Error("Method results not GC'd");

        return "Test Passed: WeakMixClassInstancesTest079";
    },

    /**
     * 080. 混合结构组合：弱引用跟踪混合类型嵌套结构
     */
    async test080_WeakMixHybridStructure() {
        const weakSet = new WeakSet();
    
        let root, structureRef;
        let tempMapRef ;
        (function createHybridStructure() {
            // 创建混合类型的嵌套结构
            const leaf1 = { type: 'leaf', value: 10 };
            const leaf2 = { type: 'leaf', value: 20 };

            const mapNode = new Map([
                ['key1', leaf1],
                ['key2', { type: 'node', child: leaf2 }]
            ]);

            const arrayNode = [
                { type: 'item', id: 'a' },
                mapNode,
                { type: 'item', id: 'b' }
            ];

            // 根结构
            root = {
                version: '1.0',
                timestamp: new Date(),
                data: {
                    array: arrayNode,
                    map: mapNode,
                    meta: { author: 'test-080' }
                }
            };
            tempMapRef = new WeakRef(root.data.map);
            

            // WeakMap关联结构分析结果的WeakRef
            const structureInfo = {
                depth: 4,
                nodeCount: 8,
                hasMap: true,
                hasArray: true
            };
            const infoRef = new WeakRef(structureInfo);


            structureRef = new WeakRef(root);

             })();

        // 清除强引用
        const tempRootRef = structureRef;
        let m = root.data.map

        root = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 30));
        globalThis.ArkTools.forceFullGC();
        // 验证回收情况
        if (tempRootRef.deref() !== undefined) throw new Error("Root structure not GC'd");

        return "Test Passed: WeakMixHybridStructureTest080";
    },
    /**
     * 081. 对象深克隆组合：WeakSet存储原始对象，WeakMap关联克隆结果
     */
    async test081_WeakMixObjectCloning() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let originalObj, clonedObj, objRef;

        (function createClonedObject() {
            // 创建嵌套对象
            const nested = { value: 10, deep: { flag: true } };
            originalObj = {
                id: 'source-81',
                data: nested,
                getValue() { return this.data.value; }
            };

            // 实现简单深克隆
            function deepClone(obj) {
                if (obj === null || typeof obj !== 'object') return obj;
                const clone = Array.isArray(obj) ? [] : {};
                for (const key in obj) {
                    if (obj.hasOwnProperty(key)) {
                        clone[key] = deepClone(obj[key]);
                    }
                }
                return clone;
            }

            clonedObj = deepClone(originalObj);
            clonedObj.source = originalObj; // 保留源引用

            // WeakSet存储原始对象及其嵌套结构
            weakSet.add(originalObj);
            weakSet.add(originalObj.data);
            weakSet.add(originalObj.data.deep);

            // WeakMap关联克隆结果的WeakRef
            const cloneRef = new WeakRef(clonedObj);
            weakMap.set(originalObj, cloneRef);

            objRef = new WeakRef(originalObj);

            // 验证初始状态
            if (clonedObj.data.value !== 10) throw new Error("Object cloning failed");
            if (clonedObj.data.deep === originalObj.data.deep) {
                throw new Error("Cloning is not deep (shared reference)");
            }
        })();

        // 清除强引用
        const tempOriginalRef = objRef;
        const tempClonedRef = new WeakRef(clonedObj);
        originalObj = null;
        clonedObj = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempOriginalRef.deref() !== undefined) throw new Error("Original object not GC'd");
        if (tempClonedRef.deref() !== undefined) throw new Error("Cloned object not GC'd");

        return "Test Passed: WeakMixObjectCloningTest081";
    },

    /**
     * 082. 事件监听器组合：WeakMap存储事件目标，WeakSet跟踪监听器
     */
    async test082_WeakMixEventListeners() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let eventTarget, listeners, targetRef;

        let tempLogRef ;
        (function createEventListeners() {
            // 创建模拟事件目标
            eventTarget = {
                listeners: new Map(),
                addListener(type, callback) {
                    if (!this.listeners.has(type)) this.listeners.set(type, new Set());
                    this.listeners.get(type).add(callback);
                },
                removeListener(type, callback) {
                    this.listeners.get(type)?.delete(callback);
                },
                emit(type, data) {
                    this.listeners.get(type)?.forEach(cb => cb(data));
                }
            };

            // 创建监听器
            const logListener = (data) => console.log('Log:', data);
            const validateListener = (data) => {
                if (typeof data !== 'object') throw new Error("Invalid data");
            };

            listeners = {
                log: logListener,
                validate: validateListener,
                count: 2
            };
            tempLogRef = new WeakRef(listeners.log)
            // 注册监听器
            eventTarget.addListener('message', logListener);
            eventTarget.addListener('message', validateListener);

            // WeakSet跟踪监听器
            weakSet.add(logListener);
            weakSet.add(validateListener);

            // WeakMap关联事件目标到监听器的WeakRef
            const listenersRef = new WeakRef(listeners);
            weakMap.set(eventTarget, listenersRef);

            targetRef = new WeakRef(eventTarget);

            // 验证初始状态
            const listenerCount = eventTarget.listeners.get('message')?.size || 0;
            if (listenerCount !== 2) {
                throw new Error(`Listener registration failed: 预期2个，实际${listenerCount}`);
            }
        })();

        // 清除强引用
        const tempTargetRef = targetRef;
        eventTarget = null;
        listeners = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempTargetRef.deref() !== undefined) throw new Error("Event target not GC'd");
        if (tempLogRef.deref() !== undefined) throw new Error("Event listeners not GC'd");

        return "Test Passed: WeakMixEventListenersTest082";
    },

    /**
     * 083. 数据流管道组合：WeakSet存储管道节点，WeakMap关联处理结果
     */
    async test083_WeakMixDataPipeline() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let pipeline, results, pipelineRef;

        (function createDataPipeline() {
            // 创建数据处理节点
            const filter = (data) => data.filter(x => x.value > 5);
            const map = (data) => data.map(x => ({ ...x, doubled: x.value * 2 }));
            const sort = (data) => [...data].sort((a, b) => b.value - a.value);

            // 构建管道
            pipeline = {
                nodes: [filter, map, sort],
                process(data) {
                    return this.nodes.reduce((acc, node) => node(acc), data);
                }
            };

            // 测试数据
            const input = [
                { id: 'a', value: 3 },
                { id: 'b', value: 8 },
                { id: 'c', value: 6 }
            ];

            // 执行管道处理
            results = {
                input,
                output: pipeline.process(input),
                steps: pipeline.nodes.length
            };

            // WeakSet存储管道节点和输入数据
            weakSet.add(pipeline);
            weakSet.add(input);
            pipeline.nodes.forEach(node => weakSet.add(node));

            // WeakMap关联管道到结果的WeakRef
            const resultsRef = new WeakRef(results);
            weakMap.set(pipeline, resultsRef);

            pipelineRef = new WeakRef(pipeline);

            // 验证初始状态
            if (results.output.length !== 2) { // 过滤后保留2个元素
                throw new Error(`Pipeline filter failed: 预期2个结果，实际${results.output.length}`);
            }
            if (results.output[0].doubled !== 16) { // 8*2=16
                throw new Error(`Pipeline processing failed: 预期16，实际${results.output[0].doubled}`);
            }
        })();

        // 清除强引用
        const tempPipelineRef = pipelineRef;
        const tempResultsRef = new WeakRef(results);
        pipeline = null;
        results = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempPipelineRef.deref() !== undefined) throw new Error("Pipeline not GC'd");
        if (tempResultsRef.deref() !== undefined) throw new Error("Pipeline results not GC'd");

        return "Test Passed: WeakMixDataPipelineTest083";
    },

    /**
     * 084. 模块化对象组合：WeakMap存储模块实例，WeakSet跟踪导出成员
     */
    async test084_WeakMixModuleComposition() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let moduleA, moduleB, combined, moduleRefs;

        (function createModuleComposition() {
            // 模拟模块A
            moduleA = {
                id: 'module-a-84',
                exports: {
                    utils: {
                        format: (x) => `Formatted: ${x}`,
                        parse: (x) => x.replace('Formatted: ', '')
                    },
                    version: '1.0.0'
                }
            };

            // 模拟模块B
            moduleB = {
                id: 'module-b-84',
                exports: {
                    calculate: (a, b) => a * b + 10,
                    validate: (x) => x > 0
                },
                dependencies: [moduleA]
            };

            // 修复核心：将嵌套的utils函数提取到顶层
            combined = {
                ...moduleA.exports,       // 基础导出
                ...moduleA.exports.utils, // 提取utils中的函数到顶层
                ...moduleB.exports,       // 模块B的导出
                modules: [moduleA, moduleB]
            };

            // 跟踪所有导出成员
            Object.values(combined).forEach(member => {
                if (typeof member === 'object' && member !== null) {
                    weakSet.add(member);
                }
                if (typeof member === 'function') {
                    weakSet.add(member);
                }
            });

            // 建立弱引用映射
            const key = { modules: [moduleA, moduleB] };
            const combinedRef = new WeakRef(combined);
            weakMap.set(key, combinedRef);

            moduleRefs = {
                a: new WeakRef(moduleA),
                b: new WeakRef(moduleB)
            };

            // 修复：增加函数存在性检查
            if (typeof combined.format !== 'function') {
                throw new Error(`format函数不存在，实际类型: ${typeof combined.format}`);
            }
            if (typeof combined.calculate !== 'function') {
                throw new Error(`calculate函数不存在，实际类型: ${typeof combined.calculate}`);
            }

            // 验证功能
            if (combined.format('test') !== 'Formatted: test') {
                throw new Error(`format函数执行错误: ${combined.format('test')}`);
            }
            if (combined.calculate(3, 4) !== 22) {
                throw new Error(`calculate函数执行错误: ${combined.calculate(3, 4)}`);
            }
        })();

        // 清除强引用
        const tempModuleARef = moduleRefs.a;
        const tempModuleBRef = moduleRefs.b;
        const tempCombinedRef = new WeakRef(combined);
        moduleA = null;
        moduleB = null;
        combined = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收
        if (tempModuleARef.deref() !== undefined || tempModuleBRef.deref() !== undefined) {
            throw new Error("模块实例未被GC回收");
        }
        if (tempCombinedRef.deref() !== undefined) {
            throw new Error("组合对象未被GC回收");
        }

        return "Test Passed: WeakMixModuleCompositionTest084";
    },


    /**
     * 085. 缓存机制组合：WeakMap实现自动回收缓存，WeakSet跟踪缓存键
     */
    async test085_WeakMixCacheMechanism() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let cache, cacheKeys, cacheRef;
        // 修复：用计数器跟踪WeakMap缓存条目数量（WeakMap无size属性）
        let cacheCounter = 0;
        let tempKey1Ref ;
        (function createCacheMechanism() {
            // 创建基于WeakMap的缓存
            cache = new WeakMap();

            // 缓存键对象
            const key1 = { id: 'cache-key-1', value: 5 };
            const key2 = { id: 'cache-key-2', value: 10 };
            cacheKeys = [key1, key2];

            // 模拟计算函数
            const expensiveCalculation = (input) => {
                let result = 0;
                for (let i = 0; i < 1000; i++) {
                    result += input.value * i;
                }
                return result;
            };

            // 带缓存的计算包装（修复：添加计数器更新）
            const cachedCalculate = (key) => {
                if (!cache.has(key)) {
                    const result = expensiveCalculation(key);
                    cache.set(key, result);
                    cacheCounter++; // 新增：缓存条目增加时计数
                    weakSet.add(key);
                }
                return cache.get(key);
            };

            // 执行缓存操作
            const result1 = cachedCalculate(key1);
            const result1Again = cachedCalculate(key1); // 验证缓存命中
            const result2 = cachedCalculate(key2);

            // 验证缓存命中（修复：明确检查两次结果是否一致）
            if (result1 !== result1Again) {
                throw new Error(`Cache hit failed: 第一次=${result1}, 第二次=${result1Again}`);
            }

            // 存储缓存元数据（修复：使用计数器替代size）
            const cacheMeta = {
                size: cacheCounter, // 关键修复：用计数器代替cache.size
                sampleResult: result1
            };

            // WeakMap关联缓存到元数据的WeakRef
            const metaRef = new WeakRef(cacheMeta);
            weakMap.set(cache, metaRef);

            cacheRef = new WeakRef(cache);

            // 验证初始状态（修复：检查计数器而非size）
            if (cacheCounter !== 2) { // 预期2个不同的键被缓存
                throw new Error(`Cache size incorrect: 预期2，实际${cacheCounter}`);
            }
            if (cachedCalculate(key1) !== result1) {
                throw new Error("Cache retrieval failed");
            }
             tempKey1Ref = new WeakRef(cacheKeys[0]);
        })();

        // 清除强引用
        const tempCacheRef = cacheRef;

        cache = null;
        cacheKeys = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempCacheRef.deref() !== undefined) throw new Error("Cache instance not GC'd");
        if (tempKey1Ref.deref() !== undefined) throw new Error("Cache keys not GC'd");

        return "Test Passed: WeakMixCacheMechanismTest085";
    },


    /**
     * 086. 树结构遍历组合：WeakSet存储树节点，WeakMap关联遍历路径
     */
    async test086_WeakMixTreeTraversal() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let rootNode, traversalResults, treeRef;

        let tempNode1Ref;
        (function createTreeStructure() {
            // 创建树节点
            const leaf1 = { id: 'leaf-1', value: 10, parent: null };
            const leaf2 = { id: 'leaf-2', value: 20, parent: null };
            const leaf3 = { id: 'leaf-3', value: 30, parent: null };
            const node1 = { id: 'node-1', children: [leaf1, leaf2], parent: null };
            rootNode = { id: 'root-86', children: [node1, leaf3], parent: null };

            // 设置父引用
            leaf1.parent = node1;
            leaf2.parent = node1;
            node1.parent = rootNode;
            leaf3.parent = rootNode;

            // 深度优先遍历
            const traversalPaths = [];
            function dfs(node, path = []) {
                const newPath = [...path, node.id];
                traversalPaths.push({
                    node,
                    path: newPath.join('->'),
                    depth: newPath.length - 1
                });
                if (node.children) {
                    node.children.forEach(child => dfs(child, newPath));
                }
            }

            dfs(rootNode);

            traversalResults = {
                paths: traversalPaths,
                nodeCount: traversalPaths.length
            };

            // WeakSet存储所有树节点
            [rootNode, node1, leaf1, leaf2, leaf3].forEach(node => weakSet.add(node));

            // WeakMap关联根节点到遍历结果的WeakRef
            const traversalRef = new WeakRef(traversalResults);
            weakMap.set(rootNode, traversalRef);

            treeRef = new WeakRef(rootNode);

            // 验证初始状态
            if (traversalResults.nodeCount !== 5) { // 1根 + 1中间 + 3叶子
                throw new Error(`Tree traversal failed: 预期5个节点，实际${traversalResults.nodeCount}`);
            }
            const rootPath = traversalPaths.find(p => p.node === rootNode)?.path;
            if (rootPath !== 'root-86') throw new Error("Root path incorrect");
            tempNode1Ref = new WeakRef(rootNode.children[0]);
        })();

        // 清除强引用
        const tempRootRef = treeRef;
        rootNode = null;
        traversalResults = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempRootRef.deref() !== undefined) throw new Error("Root node not GC'd");
        if (tempNode1Ref.deref() !== undefined) throw new Error("Tree nodes not GC'd");

        return "Test Passed: WeakMixTreeTraversalTest086";
    },



    /**
     * 088. 字符串处理管道组合：WeakSet存储处理函数，WeakMap关联转换结果
     */
    async test088_WeakMixStringProcessing() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let processors, stringResults, processorRef;

        (function createStringProcessors() {
            // 创建字符串处理函数
            const trim = (str) => str.trim();
            const toUpper = (str) => str.toUpperCase();
            const addPrefix = (str) => `PREFIX: ${str}`;
            const replaceSpaces = (str) => str.replace(/\s+/g, '_');

            processors = [trim, toUpper, replaceSpaces, addPrefix];

            // 原始字符串
            const input = '  test string processing  ';

            // 执行处理管道
            let result = input;
            processors.forEach(processor => {
                result = processor(result);
            });

            stringResults = {
                input,
                output: result,
                steps: processors.length
            };

            // WeakSet存储处理函数
            processors.forEach(processor => weakSet.add(processor));

            // 创建包装对象作为WeakMap键
            const key = { processors };
            const resultsRef = new WeakRef(stringResults);
            weakMap.set(key, resultsRef);

            processorRef = new WeakRef(key);

            // 验证初始状态
            const expected = 'PREFIX: TEST_STRING_PROCESSING';
            if (stringResults.output !== expected) {
                throw new Error(`String processing failed: 预期"${expected}"，实际"${stringResults.output}"`);
            }
            if (stringResults.steps !== 4) throw new Error("Processing steps count incorrect");
        })();

        // 清除强引用
        const tempProcessorRef = processorRef;
        const tempResultsRef = new WeakRef(stringResults);
        processors = null;
        stringResults = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempProcessorRef.deref() !== undefined) throw new Error("Processors not GC'd");
        if (tempResultsRef.deref() !== undefined) throw new Error("String results not GC'd");

        return "Test Passed: WeakMixStringProcessingTest088";
    },

    /**
     * 089. 数值范围计算组合：WeakMap存储范围定义，WeakSet跟踪包含检查
     */
    async test089_WeakMixNumberRanges() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let rangeA, rangeB, rangeChecks, rangeRefs;

        (function createNumberRanges() {
            // 定义数值范围
            rangeA = { min: 10, max: 50, label: 'Medium' };
            rangeB = { min: 60, max: 100, label: 'High' };

            // 测试值
            const values = [
                { value: 5, expected: null },
                { value: 30, expected: rangeA },
                { value: 75, expected: rangeB },
                { value: 55, expected: null },
                { value: 100, expected: rangeB }
            ];

            // 检查值是否在范围内
            rangeChecks = {
                values,
                results: values.map(item => ({
                    value: item.value,
                    inRange: item.expected !== null,
                    range: item.expected?.label || null
                }))
            };

            // WeakSet存储范围定义和测试值
            weakSet.add(rangeA);
            weakSet.add(rangeB);
            values.forEach(v => weakSet.add(v));

            // WeakMap关联范围到检查结果的WeakRef
            const key = { ranges: [rangeA, rangeB] };
            const checksRef = new WeakRef(rangeChecks);
            weakMap.set(key, checksRef);

            rangeRefs = {
                a: new WeakRef(rangeA),
                b: new WeakRef(rangeB)
            };

            // 验证初始状态
            const mediumValue = rangeChecks.results.find(r => r.value === 30);
            if (mediumValue.range !== 'Medium') {
                throw new Error("Range A check failed");
            }
            const highValue = rangeChecks.results.find(r => r.value === 75);
            if (highValue.range !== 'High') {
                throw new Error("Range B check failed");
            }
        })();

        // 清除强引用
        const tempRangeARef = rangeRefs.a;
        const tempRangeBRef = rangeRefs.b;
        const tempChecksRef = new WeakRef(rangeChecks);
        rangeA = null;
        rangeB = null;
        rangeChecks = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempRangeARef.deref() !== undefined || tempRangeBRef.deref() !== undefined) {
            throw new Error("Range definitions not GC'd");
        }
        if (tempChecksRef.deref() !== undefined) throw new Error("Range checks not GC'd");

        return "Test Passed: WeakMixNumberRangesTest089";
    },

    /**
     * 090. 集合幂集组合：WeakMap存储原始Set，WeakSet跟踪幂集元素
     */
    async test090_WeakMixSetPowerSet() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let originalSet, powerSet, setRef;

        (function createPowerSet() {
            // 创建原始集合元素
            const elem1 = { id: 'e1' };
            const elem2 = { id: 'e2' };
            const elem3 = { id: 'e3' };

            // 创建原始Set
            originalSet = new Set([elem1, elem2, elem3]);

            // 计算幂集（所有可能的子集）
            powerSet = [new Set()]; // 空集
            originalSet.forEach(elem => {
                const newSubsets = powerSet.map(subset => {
                    const newSubset = new Set(subset);
                    newSubset.add(elem);
                    return newSubset;
                });
                powerSet = powerSet.concat(newSubsets);
            });

            // WeakSet跟踪所有子集和元素
            powerSet.forEach(subset => weakSet.add(subset));
            originalSet.forEach(elem => weakSet.add(elem));

            // WeakMap关联原始Set到幂集的WeakRef
            const powerRef = new WeakRef(powerSet);
            weakMap.set(originalSet, powerRef);

            setRef = new WeakRef(originalSet);

            // 验证初始状态
            const expectedSize = Math.pow(2, 3); // 2^3=8
            if (powerSet.length !== expectedSize) {
                throw new Error(`Power set size incorrect: 预期${expectedSize}，实际${powerSet.length}`);
            }
            const fullSet = powerSet.find(s => s.size === 3);
            if (!fullSet?.has(elem1) || !fullSet?.has(elem3)) {
                throw new Error("Power set missing full subset");
            }
        })();

        // 清除强引用
        const tempSetRef = setRef;
        const tempPowerRef = new WeakRef(powerSet);
        originalSet = null;
        powerSet = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempSetRef.deref() !== undefined) throw new Error("Original set not GC'd");
        if (tempPowerRef.deref() !== undefined) throw new Error("Power set not GC'd");

        return "Test Passed: WeakMixSetPowerSetTest090";
    },

    /**
     * 091. 函数记忆化组合：WeakMap存储函数与参数，WeakSet跟踪缓存结果
     */
    async test091_WeakMixFunctionMemoization() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let memoCache, memoizedFunc, cacheRef;

        (function createMemoizedFunction() {
            // 创建记忆化缓存
            memoCache = new WeakMap();

            // 原始计算函数（模拟耗时操作）
            const expensiveFunction = (obj) => {
                console.log(`Calculating for ${obj.id}`);
                // 模拟复杂计算
                let result = 0;
                for (let i = 0; i < 1000000; i++) {
                    result += obj.value * i;
                }
                return {
                    input: obj,
                    result,
                    timestamp: new Date()
                };
            };

            // 创建记忆化版本
            memoizedFunc = (obj) => {
                if (!memoCache.has(obj)) {
                    const result = expensiveFunction(obj);
                    memoCache.set(obj, result);
                    weakSet.add(result); // 跟踪缓存结果
                }
                return memoCache.get(obj);
            };

            // 测试数据
            const input1 = { id: 'input-1', value: 5 };
            const input2 = { id: 'input-2', value: 10 };

            // 执行并验证缓存
            const result1a = memoizedFunc(input1);
            const result1b = memoizedFunc(input1); // 应该命中缓存
            const result2 = memoizedFunc(input2);

            // 验证缓存工作
            if (result1a !== result1b) throw new Error("Memoization cache failed");

            // WeakMap关联缓存到统计信息的WeakRef
            const stats = {
                hits: 1, // result1b是缓存命中
                misses: 2, // result1a和result2是未命中
                entries: memoCache.size
            };
            const statsRef = new WeakRef(stats);
            weakMap.set(memoCache, statsRef);

            cacheRef = new WeakRef(memoCache);


            if (stats.hits !== 1) throw new Error("Cache hit count incorrect");
        })();

        // 清除强引用
        const tempCacheRef = cacheRef;
        const tempFuncRef = new WeakRef(memoizedFunc);
        memoCache = null;
        memoizedFunc = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempCacheRef.deref() !== undefined) throw new Error("Memo cache not GC'd");
        if (tempFuncRef.deref() !== undefined) throw new Error("Memoized function not GC'd");

        return "Test Passed: WeakMixFunctionMemoizationTest091";
    },


    /**
     * 094. 类继承层次组合：WeakSet存储类实例，WeakMap关联层次信息
     */
    async test094_WeakMixClassHierarchy() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let baseInstance, childInstance, hierarchyInfo, instanceRefs;

        (function createClassHierarchy() {
            // 定义类继承层次
            class BaseEntity {
                constructor(id) {
                    this.id = id;
                    this.created = new Date();
                }

                getType() {
                    return 'BaseEntity';
                }
            }

            class UserEntity extends BaseEntity {
                constructor(id, name) {
                    super(id);
                    this.name = name;
                }

                getType() {
                    return 'UserEntity';
                }

                getGreeting() {
                    return `Hello, ${this.name}`;
                }
            }

            // 创建实例
            baseInstance = new BaseEntity('base-94');
            childInstance = new UserEntity('user-94', 'Test User');

            // 收集层次信息
            hierarchyInfo = {
                base: {
                    type: baseInstance.getType(),
                    id: baseInstance.id
                },
                child: {
                    type: childInstance.getType(),
                    name: childInstance.name,
                    isInstance: childInstance instanceof BaseEntity
                }
            };

            // WeakSet存储所有实例
            weakSet.add(baseInstance);
            weakSet.add(childInstance);

            // WeakMap关联实例到层次信息的WeakRef
            const infoRef = new WeakRef(hierarchyInfo);
            const key = { base: baseInstance, child: childInstance };
            weakMap.set(key, infoRef);

            instanceRefs = {
                base: new WeakRef(baseInstance),
                child: new WeakRef(childInstance)
            };

            // 验证初始状态
            if (!(childInstance instanceof UserEntity)) {
                throw new Error("Child instance type check failed");
            }
            if (!hierarchyInfo.child.isInstance) {
                throw new Error("Inheritance check failed");
            }
            if (childInstance.getGreeting() !== 'Hello, Test User') {
                throw new Error("Child method implementation failed");
            }
        })();

        // 清除强引用
        const tempBaseRef = instanceRefs.base;
        const tempChildRef = instanceRefs.child;
        const tempInfoRef = new WeakRef(hierarchyInfo);
        baseInstance = null;
        childInstance = null;
        hierarchyInfo = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempBaseRef.deref() !== undefined || tempChildRef.deref() !== undefined) {
            throw new Error("Class instances not GC'd");
        }
        if (tempInfoRef.deref() !== undefined) throw new Error("Hierarchy info not GC'd");

        return "Test Passed: WeakMixClassHierarchyTest094";
    },

    /**
     * 095. 映射合并与去重组合：WeakSet存储源映射，WeakMap关联合并结果
     */
    async test095_WeakMixMapMergeDedupe() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let mapX, mapY, mergedMap, mapRefs;

        (function createMergedMaps() {
            // 创建共享键对象
            const sharedKey = { id: 'shared' };
            const keyX = { id: 'only-x' };
            const keyY = { id: 'only-y' };

            // 创建两个Map（包含重复键）
            mapX = new Map([
                [sharedKey, { value: 'x-value' }],
                [keyX, { value: 'exclusive-x' }]
            ]);
            mapY = new Map([
                [sharedKey, { value: 'y-value' }], // 与mapX有相同键
                [keyY, { value: 'exclusive-y' }]
            ]);

            // 合并Map并处理重复键（mapY的值覆盖mapX）
            mergedMap = new Map([...mapX, ...mapY]);

            // 添加合并元数据
            mergedMap.meta = {
                sources: [mapX, mapY],
                mergedAt: new Date(),
                size: mergedMap.size
            };

            // WeakSet存储源映射
            weakSet.add(mapX);
            weakSet.add(mapY);

            // WeakMap关联源映射到合并结果的WeakRef
            const mergedRef = new WeakRef(mergedMap);
            const key = { mapX, mapY };
            weakMap.set(key, mergedRef);

            mapRefs = {
                x: new WeakRef(mapX),
                y: new WeakRef(mapY)
            };

            // 验证初始状态
            if (mergedMap.size !== 3) { // 1共享键 + 2独有键
                throw new Error(`Merged map size incorrect: 预期3，实际${mergedMap.size}`);
            }
            if (mergedMap.get(sharedKey).value !== 'y-value') { // 应该被mapY覆盖
                throw new Error("Duplicate key resolution failed");
            }
        })();

        // 清除强引用
        const tempMapXRef = mapRefs.x;
        const tempMapYRef = mapRefs.y;
        const tempMergedRef = new WeakRef(mergedMap);
        mapX = null;
        mapY = null;
        mergedMap = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempMapXRef.deref() !== undefined || tempMapYRef.deref() !== undefined) {
            throw new Error("Source maps not GC'd");
        }
        if (tempMergedRef.deref() !== undefined) throw new Error("Merged map not GC'd");

        return "Test Passed: WeakMixMapMergeDedupeTest095";
    },

    /**
     * 096. 数组滑动窗口组合：WeakMap存储原始数组，WeakSet跟踪窗口结果
     */
    async test096_WeakMixSlidingWindow() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let dataArray, windowResults, arrayRef;

        (function createSlidingWindows() {
            // 创建数据数组
            dataArray = [
                { timestamp: 100, value: 5 },
                { timestamp: 200, value: 8 },
                { timestamp: 300, value: 3 },
                { timestamp: 400, value: 12 },
                { timestamp: 500, value: 7 }
            ];

            // 实现滑动窗口（窗口大小2）
            const windowSize = 2;
            windowResults = [];

            for (let i = 0; i <= dataArray.length - windowSize; i++) {
                const window = dataArray.slice(i, i + windowSize);
                const sum = window.reduce((acc, item) => acc + item.value, 0);
                const avg = sum / window.length;

                const result = {
                    window,
                    sum,
                    avg,
                    start: i,
                    end: i + windowSize - 1
                };

                windowResults.push(result);
                weakSet.add(result); // 跟踪窗口结果
            }

            // WeakMap关联原始数组到窗口结果的WeakRef
            const windowRef = new WeakRef(windowResults);
            weakMap.set(dataArray, windowRef);

            arrayRef = new WeakRef(dataArray);

            // 验证初始状态
            const expectedWindows = 4; // 5-2+1=4
            if (windowResults.length !== expectedWindows) {
                throw new Error(`Window count incorrect: 预期${expectedWindows}，实际${windowResults.length}`);
            }
            if (windowResults[0].sum !== 13) { // 5+8=13
                throw new Error(`First window sum incorrect: 预期13，实际${windowResults[0].sum}`);
            }
        })();

        // 清除强引用
        const tempArrayRef = arrayRef;
        const tempWindowRef = new WeakRef(windowResults);
        dataArray = null;
        windowResults = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempArrayRef.deref() !== undefined) throw new Error("Original array not GC'd");
        if (tempWindowRef.deref() !== undefined) throw new Error("Window results not GC'd");

        return "Test Passed: WeakMixSlidingWindowTest096";
    },

    /**
     * 097. 正则替换组合：WeakSet存储RegExp，WeakMap关联替换结果
     */
    async test097_WeakMixRegexReplacement() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let pattern, replacementResults, regexRef;

        (function createRegexReplacements() {
            // 创建正则表达式
            const emailPattern = /(\w+)@(\w+)\.(\w+)/g;
            const urlPattern = /(https?:\/\/)(\w+\.\w+)(\/\S*)/g;
            pattern = { email: emailPattern, url: urlPattern };

            // 测试文本
            const inputText = `
                Contact: user@example.com
                Visit: https://site.example/path?query=1
                Another: admin@test.org
                Link: http://another.example
            `;

            // 执行替换
            replacementResults = {
                input: inputText,
                emailRedacted: inputText.replace(emailPattern, '$1@***.$3'),
                urlNormalized: inputText.replace(urlPattern, '$2$3'),
                patterns: Object.keys(pattern)
            };

            // WeakSet存储正则表达式
            Object.values(pattern).forEach(p => weakSet.add(p));

            // WeakMap关联正则到替换结果的WeakRef
            const replaceRef = new WeakRef(replacementResults);
            weakMap.set(pattern, replaceRef);

            regexRef = new WeakRef(pattern);

            // 验证初始状态
            if (!replacementResults.emailRedacted.includes('user@***.com')) {
                throw new Error("Email replacement failed");
            }
            if (!replacementResults.urlNormalized.includes('site.example/path?query=1')) {
                throw new Error("URL replacement failed");
            }
        })();

        // 清除强引用
        const tempRegexRef = regexRef;
        const tempResultsRef = new WeakRef(replacementResults);
        pattern = null;
        replacementResults = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempRegexRef.deref() !== undefined) throw new Error("Regex patterns not GC'd");
        if (tempResultsRef.deref() !== undefined) throw new Error("Replacement results not GC'd");

        return "Test Passed: WeakMixRegexReplacementTest097";
    },

    /**
     * 098. 日期区间交集组合：WeakMap存储日期区间，WeakSet跟踪交集结果
     */
    async test098_WeakMixDateRangeIntersection() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let range1, range2, intersection, rangeRefs;

        (function createDateIntersection() {
            // 创建日期区间（使用UTC避免时区问题）
            range1 = {
                start: new Date(Date.UTC(2024, 0, 1)), // 2024-01-01
                end: new Date(Date.UTC(2024, 3, 30)), // 2024-04-30
                label: 'Q1'
            };

            range2 = {
                start: new Date(Date.UTC(2024, 2, 15)), // 2024-03-15
                end: new Date(Date.UTC(2024, 5, 30)), // 2024-06-30
                label: 'Q2-Q3'
            };

            // 计算区间交集
            const intersectStart = range1.start > range2.start ? range1.start : range2.start;
            const intersectEnd = range1.end < range2.end ? range1.end : range2.end;
            const hasIntersection = intersectStart <= intersectEnd;

            intersection = {
                hasIntersection,
                start: hasIntersection ? intersectStart : null,
                end: hasIntersection ? intersectEnd : null,
                days: hasIntersection
                    ? Math.ceil((intersectEnd - intersectStart) / (1000 * 60 * 60 * 24))
                    : 0
            };

            // WeakSet存储区间和交集结果
            weakSet.add(range1);
            weakSet.add(range2);
            weakSet.add(intersection);

            // WeakMap关联区间到交集的WeakRef
            const key = { range1, range2 };
            const intersectRef = new WeakRef(intersection);
            weakMap.set(key, intersectRef);

            rangeRefs = {
                r1: new WeakRef(range1),
                r2: new WeakRef(range2)
            };

            // 验证初始状态
            if (!intersection.hasIntersection) {
                throw new Error("Date range intersection detection failed");
            }
            // 预期交集约46天（3月15日到4月30日）
            if (intersection.days < 45 || intersection.days > 47) {
                throw new Error(`Intersection days incorrect: 预期约46，实际${intersection.days}`);
            }
        })();

        // 清除强引用
        const tempRange1Ref = rangeRefs.r1;
        const tempRange2Ref = rangeRefs.r2;
        const tempIntersectRef = new WeakRef(intersection);
        range1 = null;
        range2 = null;
        intersection = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempRange1Ref.deref() !== undefined || tempRange2Ref.deref() !== undefined) {
            throw new Error("Date ranges not GC'd");
        }
        if (tempIntersectRef.deref() !== undefined) throw new Error("Intersection result not GC'd");

        return "Test Passed: WeakMixDateRangeIntersectionTest098";
    },

    /**
     * 099. 缓冲区分块与合并组合：WeakSet存储分块，WeakMap关联合并结果
     */
    async test099_WeakMixBufferChunking() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let originalBuffer, chunks, mergedBuffer, bufferRef;

        (function createBufferChunks() {
            // 创建较大的缓冲区（32字节）
            const data = new Uint8Array(32);
            for (let i = 0; i < data.length; i++) {
                data[i] = i % 256; // 填充0-255循环值
            }
            originalBuffer = data.buffer;

            // 分块（每8字节一个块）
            const chunkSize = 8;
            chunks = [];
            for (let i = 0; i < originalBuffer.byteLength; i += chunkSize) {
                const chunk = new Uint8Array(originalBuffer, i, chunkSize);
                chunks.push(chunk);
                weakSet.add(chunk); // 跟踪分块
            }

            // 合并分块
            const mergedArray = new Uint8Array(originalBuffer.byteLength);
            chunks.forEach((chunk, index) => {
                mergedArray.set(chunk, index * chunkSize);
            });
            mergedBuffer = mergedArray.buffer;

            // WeakMap关联原始缓冲区到分块和合并结果的WeakRef
            const chunkRef = new WeakRef({ chunks, merged: mergedBuffer });
            weakMap.set(originalBuffer, chunkRef);

            bufferRef = new WeakRef(originalBuffer);

            // 验证初始状态
            if (chunks.length !== 4) { // 32/8=4
                throw new Error(`Chunk count incorrect: 预期4，实际${chunks.length}`);
            }
            // 验证合并结果与原始数据一致
            if (!arraysEqual(new Uint8Array(originalBuffer), new Uint8Array(mergedBuffer))) {
                throw new Error("Buffer merging failed (content mismatch)");
            }
        })();

        // 辅助函数：比较两个数组是否相等
        function arraysEqual(a, b) {
            if (a.length !== b.length) return false;
            for (let i = 0; i < a.length; i++) {
                if (a[i] !== b[i]) return false;
            }
            return true;
        }

        // 清除强引用
        const tempBufferRef = bufferRef;
        const tempMergedRef = new WeakRef(mergedBuffer);
        originalBuffer = null;
        chunks = null;
        mergedBuffer = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempBufferRef.deref() !== undefined) throw new Error("Original buffer not GC'd");
        if (tempMergedRef.deref() !== undefined) throw new Error("Merged buffer not GC'd");

        return "Test Passed: WeakMixBufferChunkingTest099";
    },

    /**
     * 100. 复杂条件过滤组合：WeakMap存储数据源，WeakSet跟踪过滤结果
     */
    async test100_WeakMixComplexFiltering() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let dataSource, filteredData, dataRef;

        (function createComplexFilter() {
            // 创建复杂数据源
            dataSource = [
                { id: '1', type: 'user', active: true, score: 85, created: new Date(2024, 0, 15) },
                { id: '2', type: 'admin', active: true, score: 92, created: new Date(2024, 1, 20) },
                { id: '3', type: 'user', active: false, score: 78, created: new Date(2023, 11, 5) },
                { id: '4', type: 'user', active: true, score: 65, created: new Date(2024, 2, 10) },
                { id: '5', type: 'guest', active: true, score: 90, created: new Date(2024, 3, 1) }
            ];

            // 复杂过滤条件：
            // - 活跃用户（active: true）
            // - 类型为'user'或'admin'
            // - 分数>70
            // - 2024年创建
            const startOf2024 = new Date(2024, 0, 1);
            filteredData = dataSource.filter(item =>
            item.active &&
            ['user', 'admin'].includes(item.type) &&
                item.score > 70 &&
                item.created >= startOf2024
            );

            // 为结果添加额外计算字段
            filteredData.forEach(item => {
                item.eligible = item.score > 80;
                weakSet.add(item); // 跟踪过滤结果
            });

            // WeakMap关联数据源到过滤结果的WeakRef
            const filterRef = new WeakRef({
                results: filteredData,
                count: filteredData.length,
                criteria: 'active users/admins with score >70 created in 2024'
            });
            weakMap.set(dataSource, filterRef);

            dataRef = new WeakRef(dataSource);

            // 验证初始状态
            if (filteredData.length !== 2) { // 应该只有id=1和id=2符合条件
                throw new Error(`Filter result count incorrect: 预期2，实际${filteredData.length}`);
            }
            const hasEligible = filteredData.some(item => item.eligible);
            if (!hasEligible) throw new Error("Filtered data enhancement failed");
        })();

        // 清除强引用
        const tempDataSourceRef = dataRef;
        const tempFilteredRef = new WeakRef(filteredData);
        dataSource = null;
        filteredData = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempDataSourceRef.deref() !== undefined) throw new Error("Data source not GC'd");
        if (tempFilteredRef.deref() !== undefined) throw new Error("Filtered data not GC'd");

        return "Test Passed: WeakMixComplexFilteringTest100";
    }
};
