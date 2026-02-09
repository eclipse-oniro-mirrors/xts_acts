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


export default function gridContainerPropsJsTest() {
    describe('gridContainerPropsJsTest', function() {

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
                    });
                    resolve();
                }, 500);
            });
            let clearPromise = new Promise((resolve, reject) => {
                setTimeout(() => {
                    router.clear();
                    resolve();
                }, 500);
            });
            await backToIndexPromise.then(() => {
                return clearPromise;
            });
        }

        /**
         * run before testcase
         */
        beforeAll(async function(done) {
            console.info('[gridContainerPropsJsTest] before each called')

            let result;
            let options = {
                uri: 'pages/gridContainer/prop/index'
            }
            try {
                result = router.push(options)
                console.info("push gridContainerProps page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push gridContainerProps page error " + JSON.stringify(result));
            }
            await sleep(4000)
            done()
        });

        /**
         * run after testcase
         */
        afterAll(async function() {
            console.info('[gridContainerPropsJsTest] after each called')
            await backToIndex()
            await sleep(1000)
        });

        /**
         * @tc.name   testgridContainerIdProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerIdProp', Level.LEVEL0, async function(done) {
            console.info('testgridContainerIdProp START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.idProp);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('idProp')
            done();
        });

        /**
         * @tc.name   testgridContainerClassProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerClassProp', Level.LEVEL0, async function(done) {
            console.info('testgridContainerClassProp START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classProp);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('classProp')
            expect(obj.$attrs.className).assertEqual('classProp')
            done();
        });

        /**
         * @tc.name   testgridContainerClassPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerClassPropNone', Level.LEVEL0, async function(done) {
            console.info('testgridContainerClassPropNone START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classPropNone);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('classPropNone')
            expect(obj.$attrs.className).assertEqual(undefined)
            console.info("[gridContainerProps] get className value is: " + JSON.stringify(obj.$attrs.className));
            done();
        });

        /**
         * @tc.name   testgridContainerRefProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerRefProp', Level.LEVEL0, async function(done) {
            console.info('testgridContainerRefProp START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refProp);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('refProp')
            expect(obj.$attrs.ref).assertEqual('refProp')
            done();
        });

        /**
         * @tc.name   testgridContainerRefPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerRefPropNone', Level.LEVEL0, async function(done) {
            console.info('testgridContainerRefPropNone START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refPropNone);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('refPropNone')
            expect(obj.$attrs.ref).assertEqual(undefined)
            console.info("[gridContainerProps] get ref value is: " + JSON.stringify(obj.$attrs.ref));
            done();
        });

        /**
         * @tc.name   testgridContainerDisabledPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerDisabledPropTrue', Level.LEVEL0, async function(done) {
            console.info('testgridContainerDisabledPropTrue START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropTrue);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('disabledPropTrue')
            expect(obj.$attrs.disabled).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testgridContainerDisabledPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerDisabledPropFalse', Level.LEVEL0, async function(done) {
            console.info('testgridContainerDisabledPropFalse START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropFalse);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('disabledPropFalse')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testgridContainerDisabledPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerDisabledPropNone', Level.LEVEL0, async function(done) {
            console.info('testgridContainerDisabledPropNone START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropNone);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('disabledPropNone')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testgridContainerFocusablePropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerFocusablePropTrue', Level.LEVEL0, async function(done) {
            console.info('testgridContainerFocusablePropTrue START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropTrue);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('focusablePropTrue')
            expect(obj.$attrs.focusable).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testgridContainerFocusablePropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerFocusablePropFalse', Level.LEVEL0, async function(done) {
            console.info('testgridContainerFocusablePropFalse START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropFalse);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('focusablePropFalse')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testgridContainerFocusablePropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerFocusablePropNone', Level.LEVEL0, async function(done) {
            console.info('testgridContainerFocusablePropNone START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropNone);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('focusablePropNone')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testgridContainerDataProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerDataProp', Level.LEVEL0, async function(done) {
            console.info('testgridContainerDataProp START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataProp);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('dataProp')
            expect(obj.$attrs.datagridContainer).assertEqual(undefined);
            console.info("[gridConProp] get data value is: " + JSON.stringify(obj.$attrs.datagridContainer));
            done();
        });

        /**
         * @tc.name   testgridContainerDataPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerDataPropNone', Level.LEVEL0, async function(done) {
            console.info('testgridContainerDataPropNone START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataPropNone);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('dataPropNone')
            expect(obj.$attrs.datagridContainer).assertEqual(undefined)
            console.info("[gridConProp] get data value is: " + JSON.stringify(obj.$attrs.datagridContainer));
            done();
        });

        /**
         * @tc.name   testgridContainerClickEffectPropSmall
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerClickEffectPropSmall', Level.LEVEL0, async function(done) {
            console.info('testgridContainerClickEffectPropSmall START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropSmall);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('clickEffectPropSmall')
            expect(obj.$attrs.clickEffect).assertEqual('spring-small')
            done();
        });

        /**
         * @tc.name   testgridContainerClickEffectPropMedium
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerClickEffectPropMedium', Level.LEVEL0, async function(done) {
            console.info('testgridContainerClickEffectPropMedium START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropMedium);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('clickEffectPropMedium')
            expect(obj.$attrs.clickEffect).assertEqual('spring-medium')
            done();
        });

        /**
         * @tc.name   testgridContainerClickEffectPropLarge
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerClickEffectPropLarge', Level.LEVEL0, async function(done) {
            console.info('testgridContainerClickEffectPropLarge START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropLarge);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('clickEffectPropLarge')
            expect(obj.$attrs.clickEffect).assertEqual('spring-large')
            done();
        });

        /**
         * @tc.name   testgridContainerClickEffectPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerClickEffectPropNone', Level.LEVEL0, async function(done) {
            console.info('testgridContainerClickEffectPropNone START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropNone);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('clickEffectPropNone')
            expect(obj.$attrs.clickEffect).assertEqual(undefined)
            console.info("[gridContainerProps] get clickEffect value is: " + JSON.stringify(obj.$attrs.clickEffect));
            done();
        });

        /**
         * @tc.name   testgridContainerDirPropRtl
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerDirPropRtl', Level.LEVEL0, async function(done) {
            console.info('testgridContainerDirPropRtl START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropRtl);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('dirPropRtl')
            expect(obj.$attrs.dir).assertEqual('rtl')
            done();
        });

        /**
         * @tc.name   testgridContainerDirPropLtr
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerDirPropLtr', Level.LEVEL0, async function(done) {
            console.info('testgridContainerDirPropLtr START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropLtr);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('dirPropLtr')
            expect(obj.$attrs.dir).assertEqual('ltr')
            done();
        });

        /**
         * @tc.name   testgridContainerDirPropAuto
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerDirPropAuto', Level.LEVEL0, async function(done) {
            console.info('testgridContainerDirPropAuto START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropAuto);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('dirPropAuto')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testgridContainerDirPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerDirPropNone', Level.LEVEL0, async function(done) {
            console.info('testgridContainerDirPropNone START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropNone);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('dirPropNone')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testgridContainerForPropNull
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerForPropNull', Level.LEVEL0, async function(done) {
            console.info('testgridContainerForPropNull START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropNull);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('forPropNull')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[gridContainerProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testgridContainerForPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerForPropOne', Level.LEVEL0, async function(done) {
            console.info('testgridContainerForPropOne START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropOne);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('forPropOne')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[gridContainerProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testgridContainerForPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerForPropThree', Level.LEVEL0, async function(done) {
            console.info('testgridContainerForPropThree START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropThree);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('forPropThree')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[gridContainerProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testgridContainerIfPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerIfPropTrue', Level.LEVEL0, async function(done) {
            console.info('testgridContainerIfPropTrue START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.ifPropTrue);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('ifPropTrue')
            expect(obj.$attrs.if).assertEqual(undefined)
            console.info("[gridContainerProps] get for value is: " + JSON.stringify(obj.$attrs.if));
            done();
        });

        /**
         * @tc.name   testgridContainerShowPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerShowPropTrue', Level.LEVEL0, async function(done) {
            console.info('testgridContainerShowPropTrue START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropTrue);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('showPropTrue')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[gridContainerProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testgridContainerShowPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerShowPropFalse', Level.LEVEL0, async function(done) {
            console.info('testgridContainerShowPropFalse START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropFalse);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('showPropFalse')
            expect(obj.$attrs.show).assertEqual('false')
            console.info("[gridContainerProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testgridContainerShowPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerShowPropNone', Level.LEVEL0, async function(done) {
            console.info('testgridContainerShowPropNone START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropNone);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('showPropNone')
            expect(obj.$attrs.show).assertEqual("true")
            console.info("[gridContainerProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testgridContainerColumnsPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerColumnsPropNone', Level.LEVEL0, async function(done) {
            console.info('testgridContainerXsPropNone START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeColumnsNull);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('typeColumnsNull')
            expect(obj.$attrs.columns).assertEqual('auto')
            console.info("[gridContainerProps] get columns value is: " + JSON.stringify(obj.$attrs.columns));
            done();
        });

        /**
         * @tc.name   testgridContainerColumnsPropXs
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerColumnsPropXs', Level.LEVEL0, async function(done) {
            console.info('testgridContainerXsProp1 START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeColumnsXs);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('typeColumnsXs')
            expect(obj.$attrs.columns).assertEqual('xs')
            console.info("[gridContainerProps] get columns value is: " + JSON.stringify(obj.$attrs.columns));
            done();
        });

        /**
         * @tc.name   testgridContainerColumnsPropSm
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerColumnsPropSm', Level.LEVEL0, async function(done) {
            console.info('testgridContainerXsProp1 START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeColumnsSm);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('typeColumnsSm')
            expect(obj.$attrs.columns).assertEqual('sm')
            console.info("[gridContainerProps] get columns value is: " + JSON.stringify(obj.$attrs.columns));
            done();
        });

        /**
         * @tc.name   testgridContainerColumnsPropMd
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerColumnsPropMd', Level.LEVEL0, async function(done) {
            console.info('testgridContainerXsPropObject START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeColumnsMd);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('typeColumnsMd')
            expect(obj.$attrs.columns).assertEqual("md")
            console.info("[gridContainerProps] get columns value is: " + JSON.stringify(obj.$attrs.columns));
            done();
        });

        /**
         * @tc.name   testgridContainerColumnsPropLg
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerColumnsPropLg', Level.LEVEL0, async function(done) {
            console.info('testgridContainerXsPropObject START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeColumnsLg);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('typeColumnsLg')
            expect(obj.$attrs.columns).assertEqual("lg")
            console.info("[gridContainerProps] get columns value is: " + JSON.stringify(obj.$attrs.columns));
            done();
        });

        /**
         * @tc.name   testgridContainerSizePropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerSizePropNone', Level.LEVEL0, async function(done) {
            console.info('testgridContainerXsPropNone START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeSizetypeNull);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('typeSizetypeNull')
            expect(obj.$attrs.sizetype).assertEqual("auto")
            console.info("[gridContainerProps] get size value is: " + JSON.stringify(obj.$attrs.sizetype));
            done();
        });

        /**
         * @tc.name   testgridContainerSizePropXs
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerSizePropXs', Level.LEVEL0, async function(done) {
            console.info('testgridContainerXsProp1 START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeSizetypeXs);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('typeSizetypeXs')
            expect(obj.$attrs.sizetype).assertEqual("xs")
            console.info("[gridContainerProps] get size value is: " + JSON.stringify(obj.$attrs.sizetype));
            done();
        });

        /**
         * @tc.name   testgridContainerSizePropSm
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerSizePropSm', Level.LEVEL0, async function(done) {
            console.info('testgridContainerXsProp1 START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeSizetypeSm);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('typeSizetypeSm')
            expect(obj.$attrs.sizetype).assertEqual('sm')
            console.info("[gridContainerProps] get size value is: " + JSON.stringify(obj.$attrs.sizetype));
            done();
        });

        /**
         * @tc.name   testgridContainerSizePropMd
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerSizePropMd', Level.LEVEL0, async function(done) {
            console.info('testgridContainerXsPropObject START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeSizetypeMd);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('typeSizetypeMd')
            expect(obj.$attrs.sizetype).assertEqual("md")
            console.info("[gridContainerProps] get size value is: " + JSON.stringify(obj.$attrs.sizetype));
            done();
        });

        /**
         * @tc.name   testgridContainerSizePropLg
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerSizePropLg', Level.LEVEL0, async function(done) {
            console.info('testgridContainerXsPropObject START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeSizetypeLg);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('typeSizetypeLg')
            expect(obj.$attrs.sizetype).assertEqual("lg")
            console.info("[gridContainerProps] get size value is: " + JSON.stringify(obj.$attrs.sizetype));
            done();
        });

        /**
         * @tc.name   testgridContainerGutterProp16
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerGutterProp16', Level.LEVEL0, async function(done) {
            console.info('testgridContainerSmPropNone START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeGutter16);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('typeGutter16')
            expect(obj.$attrs.gutter).assertEqual("16px")
            console.info("[gridContainerProps] get gutter value is: " + JSON.stringify(obj.$attrs.gutter));
            done();
        });

        /**
         * @tc.name   testgridContainerGutterProp30
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerGutterProp30', Level.LEVEL0, async function(done) {
            console.info('testgridContainerSmPropNone START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeGutter30);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('typeGutter30')
            expect(obj.$attrs.gutter).assertEqual("30px")
            console.info("[gridContainerProps] get gutter value is: " + JSON.stringify(obj.$attrs.gutter));
            done();
        });

        /**
         * @tc.name   testgridContainerGridtemplatePropDefault
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testgridContainerGridtemplatePropDefault', Level.LEVEL0, async function(done) {
            console.info('testgridContainerSmProp1 START');
            console.info("[gridContainerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeGridtemplateDefault);
            console.info("[gridContainerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[gridContainerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('grid-container')
            expect(obj.$attrs.id).assertEqual('typeGridtemplateDefault')
            expect(obj.$attrs.gridtemplate).assertEqual("default")
            console.info("[gridContainerProps] get gridtemplate value is: " + JSON.stringify(obj.$attrs.gridtemplate));
            done();
        });

    });
}