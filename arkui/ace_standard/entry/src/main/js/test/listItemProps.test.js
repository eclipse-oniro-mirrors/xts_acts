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


export default function listItemPropsJsTest() {
    describe('listItemPropsJsTest', function() {

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
            console.info('[listItemPropsJsTest] before each called')

            let result;
            let options = {
                uri: 'pages/listItem/prop/index'
            }
            try {
                result = router.push(options)
                console.info("push listItemProps page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push listItemProps page error " + JSON.stringify(result));
            }
            await sleep(4000)
            done()
        })

        /**
         * run after testcase
         */
        afterAll(async function() {
            console.info('[listItemPropsJsTest] after each called')
            await backToIndex();
            await sleep(1000)
        })

        // 通用属性

        /**
         * @tc.name   testlistItemIdProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemIdProp', Level.LEVEL0, async function(done) {
            console.info('testlistItemIdProp START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.idProp);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('idProp')
            done();
        })

        /**
         * @tc.name   testlistItemClassProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemClassProp', Level.LEVEL0, async function(done) {
            console.info('testlistItemClassProp START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classProp);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('classProp')
            expect(obj.$attrs.className).assertEqual('classProp')
            done();
        })

        /**
         * @tc.name   testlistItemClassPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemClassPropNone', Level.LEVEL0, async function(done) {
            console.info('testlistItemClassPropNone START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classPropNone);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('classPropNone')
            expect(obj.$attrs.className).assertEqual(undefined)
            console.info("[listItemProps] get className value is: " + JSON.stringify(obj.$attrs.className));
            done();
        })

        /**
         * @tc.name   testlistItemRefProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemRefProp', Level.LEVEL0, async function(done) {
            console.info('testlistItemRefProp START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refProp);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('refProp')
            expect(obj.$attrs.ref).assertEqual('refProp')
            done();
        });

        /**
         * @tc.name   testlistItemRefPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemRefPropNone', Level.LEVEL0, async function(done) {
            console.info('testlistItemRefPropNone START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refPropNone);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('refPropNone')
            expect(obj.$attrs.ref).assertEqual(undefined)
            console.info("[listItemProps] get ref value is: " + JSON.stringify(obj.$attrs.ref));
            done();
        });

        /**
         * @tc.name   testlistItemDisabledPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemDisabledPropTrue', Level.LEVEL0, async function(done) {
            console.info('testlistItemDisabledPropTrue START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropTrue);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('disabledPropTrue')
            expect(obj.$attrs.disabled).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testlistItemDisabledPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemDisabledPropFalse', Level.LEVEL0, async function(done) {
            console.info('testlistItemDisabledPropFalse START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropFalse);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('disabledPropFalse')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testlistItemDisabledPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemDisabledPropNone', Level.LEVEL0, async function(done) {
            console.info('testlistItemDisabledPropNone START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropNone);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('disabledPropNone')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testlistItemFocusablePropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemFocusablePropTrue', Level.LEVEL0, async function(done) {
            console.info('testlistItemFocusablePropTrue START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropTrue);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('focusablePropTrue')
            expect(obj.$attrs.focusable).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testlistItemFocusablePropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemFocusablePropFalse', Level.LEVEL0, async function(done) {
            console.info('testlistItemFocusablePropFalse START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropFalse);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('focusablePropFalse')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testlistItemFocusablePropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemFocusablePropNone', Level.LEVEL0, async function(done) {
            console.info('testlistItemFocusablePropNone START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropNone);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('focusablePropNone')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testlistItemDataProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemDataProp', Level.LEVEL0, async function(done) {
            console.info('testlistItemDataProp START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataProp);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('dataProp')
            expect(obj.$attrs.datalistItem).assertEqual(undefined);
            console.info("[listItemProps] get datalistItem value is: " + JSON.stringify(obj.$attrs.datalistItem));
            done();
        });

        /**
         * @tc.name   testlistItemDataPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemDataPropNone', Level.LEVEL0, async function(done) {
            console.info('testlistItemDataPropNone START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataPropNone);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('dataPropNone')
            expect(obj.$attrs.datalistItem).assertEqual(undefined)
            console.info("[listItemProps] get datalistItem value is: " + JSON.stringify(obj.$attrs.datalistItem));
            done();
        });

        /**
         * @tc.name   testlistItemClickEffectPropSmall
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemClickEffectPropSmall', Level.LEVEL0, async function(done) {
            console.info('testlistItemClickEffectPropSmall START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropSmall);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('clickEffectPropSmall')
            expect(obj.$attrs.clickEffect).assertEqual('spring-small')
            done();
        });

        /**
         * @tc.name   testlistItemClickEffectPropMedium
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemClickEffectPropMedium', Level.LEVEL0, async function(done) {
            console.info('testlistItemClickEffectPropMedium START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropMedium);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('clickEffectPropMedium')
            expect(obj.$attrs.clickEffect).assertEqual('spring-medium')
            done();
        });

        /**
         * @tc.name   testlistItemClickEffectPropLarge
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemClickEffectPropLarge', Level.LEVEL0, async function(done) {
            console.info('testlistItemClickEffectPropLarge START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropLarge);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('clickEffectPropLarge')
            expect(obj.$attrs.clickEffect).assertEqual('spring-large')
            done();
        });

        /**
         * @tc.name   testlistItemClickEffectPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemClickEffectPropNone', Level.LEVEL0, async function(done) {
            console.info('testlistItemClickEffectPropNone START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropNone);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('clickEffectPropNone')
            expect(obj.$attrs.clickEffect).assertEqual(undefined)
            console.info("[listItemProps] get clickEffect value is: " + JSON.stringify(obj.$attrs.clickEffect));
            done();
        });

        /**
         * @tc.name   testlistItemDirPropRtl
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemDirPropRtl', Level.LEVEL0, async function(done) {
            console.info('testlistItemDirPropRtl START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropRtl);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('dirPropRtl')
            expect(obj.$attrs.dir).assertEqual('rtl')
            done();
        });

        /**
         * @tc.name   testlistItemDirPropLtr
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemDirPropLtr', Level.LEVEL0, async function(done) {
            console.info('testlistItemDirPropLtr START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropLtr);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('dirPropLtr')
            expect(obj.$attrs.dir).assertEqual('ltr')
            done();
        });

        /**
         * @tc.name   testlistItemDirPropAuto
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemDirPropAuto', Level.LEVEL0, async function(done) {
            console.info('testlistItemDirPropAuto START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropAuto);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('dirPropAuto')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testlistItemDirPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemDirPropNone', Level.LEVEL0, async function(done) {
            console.info('testlistItemDirPropNone START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropNone);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('dirPropNone')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testlistItemForPropNull
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemForPropNull', Level.LEVEL0, async function(done) {
            console.info('testlistItemForPropNull START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropNull);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('forPropNull')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[listItemProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testlistItemForPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemForPropOne', Level.LEVEL0, async function(done) {
            console.info('testlistItemForPropOne START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropOne);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('forPropOne')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[listItemProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testlistItemForPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemForPropThree', Level.LEVEL0, async function(done) {
            console.info('testlistItemForPropThree START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropThree);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('forPropThree')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[listItemProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testlistItemIfPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemIfPropTrue', Level.LEVEL0, async function(done) {
            console.info('testlistItemIfPropTrue START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.ifPropTrue);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('ifPropTrue')
            expect(obj.$attrs.if).assertEqual(undefined)
            console.info("[listItemProps] get for value is: " + JSON.stringify(obj.$attrs.if));
            done();
        });

        /**
         * @tc.name   testlistItemShowPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemShowPropTrue', Level.LEVEL0, async function(done) {
            console.info('testlistItemShowPropTrue START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropTrue);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('showPropTrue')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[listItemProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testlistItemShowPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemShowPropFalse', Level.LEVEL0, async function(done) {
            console.info('testlistItemShowPropFalse START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropFalse);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('showPropFalse')
            expect(obj.$attrs.show).assertEqual('false')
            console.info("[listItemProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testlistItemShowPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemShowPropNone', Level.LEVEL0, async function(done) {
            console.info('testlistItemShowPropNone START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropNone);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('showPropNone')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[listItemProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        // 特有属性

        /**
         * @tc.name   testlistItemType
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemType', Level.LEVEL0, async function(done) {
            console.info('testlistItemType START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.Type);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('Type')
            expect(obj.$attrs.type).assertEqual('default')
            console.info("[listItemProps] get type value is: " + JSON.stringify(obj.$attrs.type));
            done();
        });

        /**
         * @tc.name   testlistItemTypeNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemTypeNone', Level.LEVEL0, async function(done) {
            console.info('testlistItemTypeNone START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.TypeNone);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('TypeNone')
            expect(obj.$attrs.type).assertEqual('default')
            console.info("[listItemProps] get type value is: " + JSON.stringify(obj.$attrs.type));
            done();
        });

        /**
         * @tc.name   testlistItemprimaryFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemprimaryFalse', Level.LEVEL0, async function(done) {
            console.info('testlistItemprimaryFalse START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.primaryFalse);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('primaryFalse')
            expect(obj.$attrs.primary).assertEqual('false')
            console.info("[listItemProps] get primary value is: " + JSON.stringify(obj.$attrs.primary));
            done();
        });

        /**
         * @tc.name   testlistItemprimaryTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemprimaryTrue', Level.LEVEL0, async function(done) {
            console.info('testlistItemprimaryTrue START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.primaryTrue);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('primaryTrue')
            expect(obj.$attrs.primary).assertEqual('true')
            console.info("[listItemProps] get primary value is: " + JSON.stringify(obj.$attrs.primary));
            done();
        });

        /**
         * @tc.name   testlistItemprimaryNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemprimaryNone', Level.LEVEL0, async function(done) {
            console.info('testlistItemprimaryNone START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.primaryNone);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('primaryNone')
            expect(obj.$attrs.primary).assertEqual('false')
            console.info("[listItemProps] get primary value is: " + JSON.stringify(obj.$attrs.primary));
            done();
        });

        /**
         * @tc.name   testlistItemsection
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemsection', Level.LEVEL0, async function(done) {
            console.info('testlistItemsection START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.section);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('section')
            expect(obj.$attrs.section).assertEqual('1')
            console.info("[listItemProps] get section value is: " + JSON.stringify(obj.$attrs.section));
            done();
        });

        /**
         * @tc.name   testlistItemsectionNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemsectionNone', Level.LEVEL0, async function(done) {
            console.info('testlistItemsectionNone START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.sectionNone);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('sectionNone')
            expect(obj.$attrs.section).assertEqual(undefined)
            console.info("[listItemProps] get section value is: " + JSON.stringify(obj.$attrs.section));
            done();
        });

        /**
         * @tc.name   testlistItemstickyNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemstickyNone', Level.LEVEL0, async function(done) {
            console.info('testlistItemstickyNone START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.stickyNone);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('stickyNone')
            expect(obj.$attrs.sticky).assertEqual('none')
            console.info("[listItemProps] get sticky value is: " + JSON.stringify(obj.$attrs.sticky));
            done();
        });

        /**
         * @tc.name   testlistItemstickyNormal
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemstickyNormal', Level.LEVEL0, async function(done) {
            console.info('testlistItemstickyNormal START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.stickyNormal);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('stickyNormal')
            expect(obj.$attrs.sticky).assertEqual('normal')
            console.info("[listItemProps] get sticky value is: " + JSON.stringify(obj.$attrs.sticky));
            done();
        });

        /**
         * @tc.name   testlistItemstickyOpacity
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemstickyOpacity', Level.LEVEL0, async function(done) {
            console.info('testlistItemstickyOpacity START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.stickyOpacity);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('stickyOpacity')
            expect(obj.$attrs.sticky).assertEqual('opacity')
            console.info("[listItemProps] get sticky value is: " + JSON.stringify(obj.$attrs.sticky));
            done();
        });

        /**
         * @tc.name   testlistItemstickyNo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemstickyNo', Level.LEVEL0, async function(done) {
            console.info('testlistItemstickyNo START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.stickyNo);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('stickyNo')
            expect(obj.$attrs.sticky).assertEqual('none')
            console.info("[listItemProps] get sticky value is: " + JSON.stringify(obj.$attrs.sticky));
            done();
        });

        /**
         * @tc.name   testlistItemclickeffectTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemclickeffectTrue', Level.LEVEL0, async function(done) {
            console.info('testlistItemclickeffectTrue START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickeffectTrue);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('clickeffectTrue')
            expect(obj.$attrs.clickeffect).assertEqual('true')
            console.info("[listItemProps] get clickeffect value is: " + JSON.stringify(obj.$attrs.clickeffect));
            done();
        });

        /**
         * @tc.name   testlistItemclickeffectFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemclickeffectFalse', Level.LEVEL0, async function(done) {
            console.info('testlistItemclickeffectFalse START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickeffectFalse);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('clickeffectFalse')
            expect(obj.$attrs.clickeffect).assertEqual('true')
            console.info("[listItemProps] get clickeffect value is: " + JSON.stringify(obj.$attrs.clickeffect));
            done();
        });

        /**
         * @tc.name   testlistItemclickeffectNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testlistItemclickeffectNone', Level.LEVEL0, async function(done) {
            console.info('testlistItemclickeffectNone START');
            console.info("[listItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickeffectNone);
            console.info("[listItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[listItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('list-item')
            expect(obj.$attrs.id).assertEqual('clickeffectNone')
            expect(obj.$attrs.clickeffect).assertEqual('true')
            console.info("[listItemProps] get clickeffect value is: " + JSON.stringify(obj.$attrs.clickeffect));
            done();
        });
    });
}