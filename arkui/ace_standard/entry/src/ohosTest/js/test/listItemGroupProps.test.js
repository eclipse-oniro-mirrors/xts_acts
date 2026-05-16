/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@system.router';
import { describe, beforeAll, afterAll, it, expect, Level } from '@ohos/hypium';


export default function listItemGroupPropsJsTest() {
    describe('listItemGroupPropsJsTest', function() {

        async function sleep(time) {
            return new Promise((resolve, reject) => {
                setTimeout(() => {
                    resolve()
                }, time)
            }).then(() => {
                console.info(`sleep ${time} over...`)
            })
        }

        async function backToIndex() {
            let backToIndexPromise = new Promise((resolve, reject) => {
                setTimeout(() => {
                    router.back({
                        uri: 'pages/index/index'
                    })
                    resolve()
                }, 500)
            })
            let clearPromise = new Promise((resolve, reject) => {
                setTimeout(() => {
                    router.clear()
                    resolve()
                }, 500);
            })
            await backToIndexPromise.then(() => {
                return clearPromise
            })
        }

        /**
         * run before testcase
         */
        beforeAll(async function(done) {
            console.info('[listItemGroupPropsJsTest] before each called')

            let result;
            let options = {
                uri: 'pages/listItemGroup/prop/index'
            }
            try {
                result = router.push(options)
                console.info("push listItemGroupProps page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push listItemGroupProps page error " + JSON.stringify(result));
            }
            await sleep(4000)
            done()
        })

        /**
         * run after testcase
         */
        afterAll(async function() {
            console.info('[listItemGroupPropsJsTest] after each called')
            await backToIndex();
            await sleep(1000)
        })

        // 通用属性

        /**
         * @tc.name   testlistItemGroupIdProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemGroupIdProp', Level.LEVEL0, async function(done) {
            console.info('testlistItemGroupIdProp START');
            console.info("[listItemGroupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.idProp);
            console.info("[listItemGroupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemGroupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item-group')
            expect(obj.$attrs.id).assertEqual('idProp')
            done();
        })

        /**
         * @tc.name   testlistItemGroupClassProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemGroupClassProp', Level.LEVEL0, async function(done) {
            console.info('testlistItemGroupClassProp START');
            console.info("[listItemGroupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classProp);
            console.info("[listItemGroupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemGroupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item-group')
            expect(obj.$attrs.id).assertEqual('classProp')
            done();
        })

        /**
         * @tc.name   testlistItemGroupClassPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemGroupClassPropNone', Level.LEVEL0, async function(done) {
            console.info('testlistItemGroupClassPropNone START');
            console.info("[listItemGroupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classPropNone);
            console.info("[listItemGroupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemGroupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item-group')
            expect(obj.$attrs.id).assertEqual('classPropNone')
            expect(obj.$attrs.className).assertEqual(undefined)
            console.info("[listItemGroupProps] get className value is: " + JSON.stringify(obj.$attrs.className));
            done();
        })

        /**
         * @tc.name   testlistItemGroupRefProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemGroupRefProp', Level.LEVEL0, async function(done) {
            console.info('testlistItemGroupRefProp START');
            console.info("[listItemGroupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refProp);
            console.info("[listItemGroupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemGroupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item-group')
            expect(obj.$attrs.id).assertEqual('refProp')
            expect(obj.$attrs.ref).assertEqual('refProp')
            done();
        });

        /**
         * @tc.name   testlistItemGroupRefPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemGroupRefPropNone', Level.LEVEL0, async function(done) {
            console.info('testlistItemGroupRefPropNone START');
            console.info("[listItemGroupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refPropNone);
            console.info("[listItemGroupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemGroupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item-group')
            expect(obj.$attrs.id).assertEqual('refPropNone')
            expect(obj.$attrs.ref).assertEqual(undefined)
            console.info("[listItemGroupProps] get ref value is: " + JSON.stringify(obj.$attrs.ref));
            done();
        });

        /**
         * @tc.name   testlistItemGroupDisabledPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemGroupDisabledPropTrue', Level.LEVEL0, async function(done) {
            console.info('testlistItemGroupDisabledPropTrue START');
            console.info("[listItemGroupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropTrue);
            console.info("[listItemGroupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemGroupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item-group')
            expect(obj.$attrs.id).assertEqual('disabledPropTrue')
            expect(obj.$attrs.disabled).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testlistItemGroupDisabledPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemGroupDisabledPropFalse', Level.LEVEL0, async function(done) {
            console.info('testlistItemGroupDisabledPropFalse START');
            console.info("[listItemGroupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropFalse);
            console.info("[listItemGroupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemGroupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item-group')
            expect(obj.$attrs.id).assertEqual('disabledPropFalse')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testlistItemGroupDisabledPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemGroupDisabledPropNone', Level.LEVEL0, async function(done) {
            console.info('testlistItemGroupDisabledPropNone START');
            console.info("[listItemGroupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropNone);
            console.info("[listItemGroupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemGroupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item-group')
            expect(obj.$attrs.id).assertEqual('disabledPropNone')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testlistItemGroupFocusablePropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemGroupFocusablePropTrue', Level.LEVEL0, async function(done) {
            console.info('testlistItemGroupFocusablePropTrue START');
            console.info("[listItemGroupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropTrue);
            console.info("[listItemGroupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemGroupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item-group')
            expect(obj.$attrs.id).assertEqual('focusablePropTrue')
            expect(obj.$attrs.focusable).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testlistItemGroupFocusablePropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemGroupFocusablePropFalse', Level.LEVEL0, async function(done) {
            console.info('testlistItemGroupFocusablePropFalse START');
            console.info("[listItemGroupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropFalse);
            console.info("[listItemGroupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemGroupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item-group')
            expect(obj.$attrs.id).assertEqual('focusablePropFalse')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testlistItemGroupFocusablePropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemGroupFocusablePropNone', Level.LEVEL0, async function(done) {
            console.info('testlistItemGroupFocusablePropNone START');
            console.info("[listItemGroupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropNone);
            console.info("[listItemGroupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemGroupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item-group')
            expect(obj.$attrs.id).assertEqual('focusablePropNone')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testlistItemGroupDataProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemGroupDataProp', Level.LEVEL0, async function(done) {
            console.info('testlistItemGroupDataProp START');
            console.info("[listItemGroupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataProp);
            console.info("[listItemGroupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemGroupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item-group')
            expect(obj.$attrs.id).assertEqual('dataProp')
            expect(obj.$attrs.datalistItemGroup).assertEqual(undefined);
            console.info("[listGroupProps] value is: " + JSON.stringify(obj.$attrs.datalistItemGroup));
            done();
        });

        /**
         * @tc.name   testlistItemGroupDataPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemGroupDataPropNone', Level.LEVEL0, async function(done) {
            console.info('testlistItemGroupDataPropNone START');
            console.info("[listItemGroupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataPropNone);
            console.info("[listItemGroupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemGroupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item-group')
            expect(obj.$attrs.id).assertEqual('dataPropNone')
            expect(obj.$attrs.datalistItemGroup).assertEqual(undefined)
            console.info("[listGroupProps] value is: " + JSON.stringify(obj.$attrs.datalistItemGroup));
            done();
        });

        /**
         * @tc.name   testlistItemGroupClickEffectPropSmall
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemGroupClickEffectPropSmall', Level.LEVEL0, async function(done) {
            console.info('testlistItemGroupClickEffectPropSmall START');
            console.info("[listItemGroupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropSmall);
            console.info("[listItemGroupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemGroupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item-group')
            expect(obj.$attrs.id).assertEqual('clickEffectPropSmall')
            expect(obj.$attrs.clickEffect).assertEqual('spring-small')
            done();
        });

        /**
         * @tc.name   testlistItemGroupClickEffectPropMedium
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemGroupClickEffectPropMedium', Level.LEVEL0, async function(done) {
            console.info('testlistItemGroupClickEffectPropMedium START');
            console.info("[listItemGroupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropMedium);
            console.info("[listItemGroupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemGroupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item-group')
            expect(obj.$attrs.id).assertEqual('clickEffectPropMedium')
            expect(obj.$attrs.clickEffect).assertEqual('spring-medium')
            done();
        });

        /**
         * @tc.name   testlistItemGroupClickEffectPropLarge
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemGroupClickEffectPropLarge', Level.LEVEL0, async function(done) {
            console.info('testlistItemGroupClickEffectPropLarge START');
            console.info("[listItemGroupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropLarge);
            console.info("[listItemGroupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemGroupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item-group')
            expect(obj.$attrs.id).assertEqual('clickEffectPropLarge')
            expect(obj.$attrs.clickEffect).assertEqual('spring-large')
            done();
        });

        /**
         * @tc.name   testlistItemGroupClickEffectPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemGroupClickEffectPropNone', Level.LEVEL0, async function(done) {
            console.info('testlistItemGroupClickEffectPropNone START');
            console.info("[listItemGroupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropNone);
            console.info("[listItemGroupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemGroupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item-group')
            expect(obj.$attrs.id).assertEqual('clickEffectPropNone')
            expect(obj.$attrs.clickEffect).assertEqual(undefined)
            console.info("[listItemGroupProps] get clickEffect value is: " + JSON.stringify(obj.$attrs.clickEffect));
            done();
        });

        /**
         * @tc.name   testlistItemGroupDirPropRtl
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemGroupDirPropRtl', Level.LEVEL0, async function(done) {
            console.info('testlistItemGroupDirPropRtl START');
            console.info("[listItemGroupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropRtl);
            console.info("[listItemGroupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemGroupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item-group')
            expect(obj.$attrs.id).assertEqual('dirPropRtl')
            expect(obj.$attrs.dir).assertEqual('rtl')
            done();
        });

        /**
         * @tc.name   testlistItemGroupDirPropLtr
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemGroupDirPropLtr', Level.LEVEL0, async function(done) {
            console.info('testlistItemGroupDirPropLtr START');
            console.info("[listItemGroupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropLtr);
            console.info("[listItemGroupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemGroupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item-group')
            expect(obj.$attrs.id).assertEqual('dirPropLtr')
            expect(obj.$attrs.dir).assertEqual('ltr')
            done();
        });

        /**
         * @tc.name   testlistItemGroupDirPropAuto
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemGroupDirPropAuto', Level.LEVEL0, async function(done) {
            console.info('testlistItemGroupDirPropAuto START');
            console.info("[listItemGroupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropAuto);
            console.info("[listItemGroupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemGroupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item-group')
            expect(obj.$attrs.id).assertEqual('dirPropAuto')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testlistItemGroupDirPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemGroupDirPropNone', Level.LEVEL0, async function(done) {
            console.info('testlistItemGroupDirPropNone START');
            console.info("[listItemGroupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropNone);
            console.info("[listItemGroupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemGroupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item-group')
            expect(obj.$attrs.id).assertEqual('dirPropNone')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testlistItemGroupForPropNull
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemGroupForPropNull', Level.LEVEL0, async function(done) {
            console.info('testlistItemGroupForPropNull START');
            console.info("[listItemGroupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropNull);
            console.info("[listItemGroupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemGroupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item-group')
            expect(obj.$attrs.id).assertEqual('forPropNull')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[listItemGroupProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testlistItemGroupForPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemGroupForPropOne', Level.LEVEL0, async function(done) {
            console.info('testlistItemGroupForPropOne START');
            console.info("[listItemGroupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropOne);
            console.info("[listItemGroupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemGroupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item-group')
            expect(obj.$attrs.id).assertEqual('forPropOne')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[listItemGroupProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testlistItemGroupForPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemGroupForPropThree', Level.LEVEL0, async function(done) {
            console.info('testlistItemGroupForPropThree START');
            console.info("[listItemGroupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropThree);
            console.info("[listItemGroupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemGroupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item-group')
            expect(obj.$attrs.id).assertEqual('forPropThree')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[listItemGroupProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testlistItemGroupIfPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemGroupIfPropTrue', Level.LEVEL0, async function(done) {
            console.info('testlistItemGroupIfPropTrue START');
            console.info("[listItemGroupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.ifPropTrue);
            console.info("[listItemGroupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemGroupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item-group')
            expect(obj.$attrs.id).assertEqual('ifPropTrue')
            expect(obj.$attrs.if).assertEqual(undefined)
            console.info("[listItemGroupProps] get for value is: " + JSON.stringify(obj.$attrs.if));
            done();
        });

        /**
         * @tc.name   testlistItemGroupShowPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemGroupShowPropTrue', Level.LEVEL0, async function(done) {
            console.info('testlistItemGroupShowPropTrue START');
            console.info("[listItemGroupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropTrue);
            console.info("[listItemGroupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemGroupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item-group')
            expect(obj.$attrs.id).assertEqual('showPropTrue')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[listItemGroupProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testlistItemGroupShowPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemGroupShowPropFalse', Level.LEVEL0, async function(done) {
            console.info('testlistItemGroupShowPropFalse START');
            console.info("[listItemGroupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropFalse);
            console.info("[listItemGroupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemGroupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item-group')
            expect(obj.$attrs.id).assertEqual('showPropFalse')
            expect(obj.$attrs.show).assertEqual('false')
            console.info("[listItemGroupProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testlistItemGroupShowPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemGroupShowPropNone', Level.LEVEL0, async function(done) {
            console.info('testlistItemGroupShowPropNone START');
            console.info("[listItemGroupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropNone);
            console.info("[listItemGroupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemGroupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item-group')
            expect(obj.$attrs.id).assertEqual('showPropNone')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[listItemGroupProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        // 特有属性

        /**
         * @tc.name   testlistLitemGruopType
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistLitemGruopType', Level.LEVEL0, async function(done) {
            console.info('testlistLitemGruopType START');
            console.info("[listLitemGruopProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.Type);
            console.info("[listLitemGruopProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listLitemGruopProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item-group')
            expect(obj.$attrs.id).assertEqual('Type')
            expect(obj.$attrs.type).assertEqual('default')
            console.info("[listLitemGruopProps] get type value is: " + JSON.stringify(obj.$attrs.type));
            done();
        });

        /**
         * @tc.name   testlistLitemGruopTypeNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistLitemGruopTypeNone', Level.LEVEL0, async function(done) {
            console.info('testlistLitemGruopTypeNone START');
            console.info("[listLitemGruopProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.TypeNone);
            console.info("[listLitemGruopProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listLitemGruopProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item-group')
            expect(obj.$attrs.id).assertEqual('TypeNone')
            expect(obj.$attrs.type).assertEqual('default')
            console.info("[listLitemGruopProps] get type value is: " + JSON.stringify(obj.$attrs.type));
            done();
        });
    });
}