/*
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

export default function inputPropsJsTest() {
    describe('inputPropsJsTest', function() {

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
            console.info('[inputPropsJsTest] before each called')

            let result;
            let options = {
                uri: 'pages/input/prop/index'
            }
            try {
                result = router.push(options)
                console.info("push inputProps page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push inputProps page error " + JSON.stringify(result));
            }
            await sleep(4000)
            done()
        });

        /**
         * run after testcase
         */
        afterAll(async function() {
            console.info('[inputPropsJsTest] after each called')
            await backToIndex()
            await sleep(1000)
        });

        /**
         * @tc.name   testInputIdProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputIdProp', Level.LEVEL0, async function(done) {
            console.info('testInputIdProp START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.idProp);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('idProp')
            done();
        });

        /**
         * @tc.name   testinputClassProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testinputClassProp', Level.LEVEL0, async function(done) {
            console.info('testInputClassProp START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classProp);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('classProp')
            done();
        });

        /**
         * @tc.name   testInputClassPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputClassPropNone', Level.LEVEL0, async function(done) {
            console.info('testInputClassPropNone START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classPropNone);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('classPropNone')
            expect(obj.$attrs.className).assertEqual(undefined)
            console.info("[inputProps] get className value is: " + JSON.stringify(obj.$attrs.className));
            done();
        });

        /**
         * @tc.name   testInputRefProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputRefProp', Level.LEVEL0, async function(done) {
            console.info('testInputRefProp START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refProp);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('refProp')
            expect(obj.$attrs.ref).assertEqual('refProp')
            done();
        });

        /**
         * @tc.name   testInputRefPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputRefPropNone', Level.LEVEL0, async function(done) {
            console.info('testInputRefPropNone START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refPropNone);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('refPropNone')
            expect(obj.$attrs.ref).assertEqual(undefined)
            console.info("[inputProps] get ref value is: " + JSON.stringify(obj.$attrs.ref));
            done();
        });

        /**
         * @tc.name   testInputDisabledPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputDisabledPropTrue', Level.LEVEL0, async function(done) {
            console.info('testInputDisabledPropTrue START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropTrue);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('disabledPropTrue')
            expect(obj.$attrs.disabled).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testInputDisabledPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputDisabledPropFalse', Level.LEVEL0, async function(done) {
            console.info('testInputDisabledPropFalse START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropFalse);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('disabledPropFalse')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testInputDisabledPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputDisabledPropNone', Level.LEVEL0, async function(done) {
            console.info('testInputDisabledPropNone START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropNone);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('disabledPropNone')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testInputFocusablePropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputFocusablePropTrue', Level.LEVEL0, async function(done) {
            console.info('testInputFocusablePropTrue START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropTrue);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('focusablePropTrue')
            expect(obj.$attrs.focusable).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testInputFocusablePropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputFocusablePropFalse', Level.LEVEL0, async function(done) {
            console.info('testInputFocusablePropFalse START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropFalse);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('focusablePropFalse')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testInputFocusablePropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputFocusablePropNone', Level.LEVEL0, async function(done) {
            console.info('testInputFocusablePropNone START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropNone);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('focusablePropNone')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testInputDataProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputDataProp', Level.LEVEL0, async function(done) {
            console.info('testInputDataProp START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataProp);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('dataProp')
            expect(obj.$attrs.dataInput).assertEqual(undefined);
            console.info("[inputProps] get dataInput value is: " + JSON.stringify(obj.$attrs.dataInput));
            done();
        });

        /**
         * @tc.name   testInputDataPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputDataPropNone', Level.LEVEL0, async function(done) {
            console.info('testInputDataPropNone START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataPropNone);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('dataPropNone')
            expect(obj.$attrs.dataInput).assertEqual(undefined)
            console.info("[inputProps] get dataInput value is: " + JSON.stringify(obj.$attrs.dataInput));
            done();
        });

        /**
         * @tc.name   testInputClickEffectPropSmall
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputClickEffectPropSmall', Level.LEVEL0, async function(done) {
            console.info('testInputClickEffectPropSmall START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropSmall);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('clickEffectPropSmall')
            expect(obj.$attrs.clickEffect).assertEqual('spring-small')
            done();
        });

        /**
         * @tc.name   testInputClickEffectPropMedium
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputClickEffectPropMedium', Level.LEVEL0, async function(done) {
            console.info('testInputClickEffectPropMedium START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropMedium);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('clickEffectPropMedium')
            expect(obj.$attrs.clickEffect).assertEqual('spring-medium')
            done();
        });

        /**
         * @tc.name   testInputClickEffectPropLarge
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputClickEffectPropLarge', Level.LEVEL0, async function(done) {
            console.info('testInputClickEffectPropLarge START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropLarge);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('clickEffectPropLarge')
            expect(obj.$attrs.clickEffect).assertEqual('spring-large')
            done();
        });

        /**
         * @tc.name   testInputClickEffectPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputClickEffectPropNone', Level.LEVEL0, async function(done) {
            console.info('testInputClickEffectPropNone START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropNone);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('clickEffectPropNone')
            expect(obj.$attrs.clickEffect).assertEqual(undefined)
            console.info("[inputProps] get clickEffect value is: " + JSON.stringify(obj.$attrs.clickEffect));
            done();
        });

        /**
         * @tc.name   testInputDirPropRtl
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputDirPropRtl', Level.LEVEL0, async function(done) {
            console.info('testInputDirPropRtl START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropRtl);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('dirPropRtl')
            expect(obj.$attrs.dir).assertEqual('rtl')
            done();
        });

        /**
         * @tc.name   testInputDirPropLtr
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputDirPropLtr', Level.LEVEL0, async function(done) {
            console.info('testInputDirPropLtr START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropLtr);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('dirPropLtr')
            expect(obj.$attrs.dir).assertEqual('ltr')
            done();
        });

        /**
         * @tc.name   testInputDirPropAuto
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputDirPropAuto', Level.LEVEL0, async function(done) {
            console.info('testInputDirPropAuto START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropAuto);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('dirPropAuto')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testInputDirPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputDirPropNone', Level.LEVEL0, async function(done) {
            console.info('testInputDirPropNone START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropNone);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('dirPropNone')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testInputForPropNull
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputForPropNull', Level.LEVEL0, async function(done) {
            console.info('testInputForPropNull START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropNull);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('forPropNull')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[inputProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testInputForPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputForPropOne', Level.LEVEL0, async function(done) {
            console.info('testInputForPropOne START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropOne);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('forPropOne')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[inputProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testInputForPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputForPropThree', Level.LEVEL0, async function(done) {
            console.info('testInputForPropThree START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropThree);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('forPropThree')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[inputProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testInputIfPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputIfPropTrue', Level.LEVEL0, async function(done) {
            console.info('testInputIfPropTrue START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.ifPropTrue);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('ifPropTrue')
            expect(obj.$attrs.if).assertEqual(undefined)
            console.info("[inputProps] get for value is: " + JSON.stringify(obj.$attrs.if));
            done();
        });

        /**
         * @tc.name   testInputShowPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputShowPropTrue', Level.LEVEL0, async function(done) {
            console.info('testInputShowPropTrue START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropTrue);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('showPropTrue')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputShowPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputShowPropFalse', Level.LEVEL0, async function(done) {
            console.info('testInputShowPropFalse START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropFalse);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('showPropFalse')
            expect(obj.$attrs.show).assertEqual('false')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputShowPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputShowPropNone', Level.LEVEL0, async function(done) {
            console.info('testInputShowPropNone START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropNone);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('showPropNone')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputTypeText
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputTypeText', Level.LEVEL0, async function(done) {
            console.info('testInputTypeText START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeText);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('typeText')
            expect(obj.$attrs.type).assertEqual('text')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputTypeEmail
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputTypeEmail', Level.LEVEL0, async function(done) {
            console.info('testInputTypeEmail START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeEmail);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('typeEmail')
            expect(obj.$attrs.type).assertEqual('email')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputTypeDate
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputTypeDate', Level.LEVEL0, async function(done) {
            console.info('testInputTypeDate START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeDate);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('typeDate')
            expect(obj.$attrs.type).assertEqual('date')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputTypeTime
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputTypeTime', Level.LEVEL0, async function(done) {
            console.info('testInputTypeTime START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeTime);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('typeTime')
            expect(obj.$attrs.type).assertEqual('time')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputTypeNumber
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputTypeNumber', Level.LEVEL0, async function(done) {
            console.info('testInputTypeNumber START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeNumber);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('typeNumber')
            expect(obj.$attrs.type).assertEqual('number')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputTypePassword
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputTypePassword', Level.LEVEL0, async function(done) {
            console.info('testInputTypePassword START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typePassword);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('typePassword')
            expect(obj.$attrs.type).assertEqual('password')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputTypeButton
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputTypeButton', Level.LEVEL0, async function(done) {
            console.info('testInputTypeButton START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeButton);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('typeButton')
            expect(obj.$attrs.type).assertEqual('button')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputTypeCheckbox
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputTypeCheckbox', Level.LEVEL0, async function(done) {
            console.info('testInputTypeCheckbox START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeCheckbox);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('typeCheckbox')
            expect(obj.$attrs.type).assertEqual('checkbox')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputTypeRadio
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputTypeRadio', Level.LEVEL0, async function(done) {
            console.info('testInputTypeRadio START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeRadio);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('typeRadio')
            expect(obj.$attrs.type).assertEqual('radio')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputTypeNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputTypeNone', Level.LEVEL0, async function(done) {
            console.info('testInputTypeNone START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeNone);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('typeNone')
            expect(obj.$attrs.type).assertEqual('text')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputCheckboxFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputCheckboxFalse', Level.LEVEL0, async function(done) {
            console.info('testInputCheckboxFalse START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.checkboxFalse);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('checkboxFalse')
            expect(obj.$attrs.type).assertEqual('checkbox')
            expect(obj.$attrs.checked).assertEqual('false')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputCheckboxTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputCheckboxTrue', Level.LEVEL0, async function(done) {
            console.info('testInputCheckboxTrue START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.checkboxTrue);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('checkboxTrue')
            expect(obj.$attrs.type).assertEqual('checkbox')
            expect(obj.$attrs.checked).assertEqual('true')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputCheckboxNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputCheckboxNone', Level.LEVEL0, async function(done) {
            console.info('testInputCheckboxNone START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.checkboxNone);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('checkboxNone')
            expect(obj.$attrs.type).assertEqual('checkbox')
            expect(obj.$attrs.checked).assertEqual('false')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputRadioFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputRadioFalse', Level.LEVEL0, async function(done) {
            console.info('testInputRadioFalse START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.radioFalse);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('radioFalse')
            expect(obj.$attrs.type).assertEqual('radio')
            expect(obj.$attrs.checked).assertEqual('false')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputRadioTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputRadioTrue', Level.LEVEL0, async function(done) {
            console.info('testInputRadioTrue START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.radioTrue);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('radioTrue')
            expect(obj.$attrs.type).assertEqual('radio')
            expect(obj.$attrs.checked).assertEqual('true')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputRadioNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputRadioNone', Level.LEVEL0, async function(done) {
            console.info('testInputRadioNone START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.radioNone);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('radioNone')
            expect(obj.$attrs.type).assertEqual('radio')
            expect(obj.$attrs.checked).assertEqual('false')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputInputName
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputInputName', Level.LEVEL0, async function(done) {
            console.info('testInputInputName START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.inputName);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('inputName')
            expect(obj.$attrs.name).assertEqual('inputName')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        //inputName
        /**
         * @tc.name   testInputInputNameNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputInputNameNone', Level.LEVEL0, async function(done) {
            console.info('testInputInputNameNone START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.inputNameNone);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('inputNameNone')
            expect(obj.$attrs.name).assertEqual(undefined)
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputInputValue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputInputValue', Level.LEVEL0, async function(done) {
            console.info('testInputInputValue START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.inputValue);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('inputValue')
            expect(obj.$attrs.value).assertEqual('inputValue')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputInputValueNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputInputValueNone', Level.LEVEL0, async function(done) {
            console.info('testInputInputValueNone START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.inputValueNone);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('inputValueNone')
            expect(obj.$attrs.value).assertEqual(undefined)
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputTextPlaceholder
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputTextPlaceholder', Level.LEVEL0, async function(done) {
            console.info('testInputTextPlaceholder START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.textPlaceholder);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('textPlaceholder')
            expect(obj.$attrs.type).assertEqual('text')
            expect(obj.$attrs.placeholder).assertEqual('placeholder')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputTextPlaceholderNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputTextPlaceholderNone', Level.LEVEL0, async function(done) {
            console.info('testInputTextPlaceholderNone START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.textPlaceholderNone);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('textPlaceholderNone')
            expect(obj.$attrs.type).assertEqual('text')
            expect(obj.$attrs.placeholder).assertEqual(undefined)
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputEmailPlaceholder
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputEmailPlaceholder', Level.LEVEL0, async function(done) {
            console.info('testInputEmailPlaceholder START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.emailPlaceholder);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('emailPlaceholder')
            expect(obj.$attrs.type).assertEqual('email')
            expect(obj.$attrs.placeholder).assertEqual('placeholder')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputEmailPlaceholderNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputEmailPlaceholderNone', Level.LEVEL0, async function(done) {
            console.info('testInputEmailPlaceholderNone START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.emailPlaceholderNone);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('emailPlaceholderNone')
            expect(obj.$attrs.type).assertEqual('email')
            expect(obj.$attrs.placeholder).assertEqual(undefined)
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputDatePlaceholder
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputDatePlaceholder', Level.LEVEL0, async function(done) {
            console.info('testInputDatePlaceholder START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.datePlaceholder);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('datePlaceholder')
            expect(obj.$attrs.type).assertEqual('date')
            expect(obj.$attrs.placeholder).assertEqual('placeholder')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputDatePlaceholderNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputDatePlaceholderNone', Level.LEVEL0, async function(done) {
            console.info('testInputDatePlaceholderNone START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.datePlaceholderNone);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('datePlaceholderNone')
            expect(obj.$attrs.type).assertEqual('date')
            expect(obj.$attrs.placeholder).assertEqual(undefined)
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputTimePlaceholder
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputTimePlaceholder', Level.LEVEL0, async function(done) {
            console.info('testInputTimePlaceholder START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.timePlaceholder);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('timePlaceholder')
            expect(obj.$attrs.type).assertEqual('time')
            expect(obj.$attrs.placeholder).assertEqual('placeholder')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputTimePlaceholderNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputTimePlaceholderNone', Level.LEVEL0, async function(done) {
            console.info('testInputTimePlaceholderNone START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.timePlaceholderNone);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('timePlaceholderNone')
            expect(obj.$attrs.type).assertEqual('time')
            expect(obj.$attrs.placeholder).assertEqual(undefined)
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputNumberPlaceholder
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputNumberPlaceholder', Level.LEVEL0, async function(done) {
            console.info('testInputNumberPlaceholder START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.numberPlaceholder);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('numberPlaceholder')
            expect(obj.$attrs.type).assertEqual('number')
            expect(obj.$attrs.placeholder).assertEqual('placeholder')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputNumberPlaceholderNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputNumberPlaceholderNone', Level.LEVEL0, async function(done) {
            console.info('testInputNumberPlaceholderNone START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.numberPlaceholderNone);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('numberPlaceholderNone')
            expect(obj.$attrs.type).assertEqual('number')
            expect(obj.$attrs.placeholder).assertEqual(undefined)
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputPasswordPlaceholder
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputPasswordPlaceholder', Level.LEVEL0, async function(done) {
            console.info('testInputPasswordPlaceholder START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.passwordPlaceholder);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('passwordPlaceholder')
            expect(obj.$attrs.type).assertEqual('password')
            expect(obj.$attrs.placeholder).assertEqual('placeholder')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputPasswordPlaceholderNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputPasswordPlaceholderNone', Level.LEVEL0, async function(done) {
            console.info('testInputPasswordPlaceholderNone START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.passwordPlaceholderNone);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('passwordPlaceholderNone')
            expect(obj.$attrs.type).assertEqual('password')
            expect(obj.$attrs.placeholder).assertEqual(undefined)
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputMaxlength
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputMaxlength', Level.LEVEL0, async function(done) {
            console.info('testInputMaxlength START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.maxlength);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('maxlength')
            expect(obj.$attrs.maxlength).assertEqual('10')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputEnterkeytypeDefault
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputEnterkeytypeDefault', Level.LEVEL0, async function(done) {
            console.info('testInputEnterkeytypeDefault START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.enterkeytypeDefault);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('enterkeytypeDefault')
            expect(obj.$attrs.enterkeytype).assertEqual('default')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputEnterkeytypeNext
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputEnterkeytypeNext', Level.LEVEL0, async function(done) {
            console.info('testInputEnterkeytypeNext START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.enterkeytypeNext);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('enterkeytypeNext')
            expect(obj.$attrs.enterkeytype).assertEqual('next')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputEnterkeytypeGo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputEnterkeytypeGo', Level.LEVEL0, async function(done) {
            console.info('testInputEnterkeytypeGo START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.enterkeytypeGo);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('enterkeytypeGo')
            expect(obj.$attrs.enterkeytype).assertEqual('go')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputEnterkeytypeDone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputEnterkeytypeDone', Level.LEVEL0, async function(done) {
            console.info('testInputEnterkeytypeDone START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.enterkeytypeDone);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('enterkeytypeDone')
            expect(obj.$attrs.enterkeytype).assertEqual('done')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputEnterkeytypeSend
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputEnterkeytypeSend', Level.LEVEL0, async function(done) {
            console.info('testInputEnterkeytypeSend START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.enterkeytypeSend);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('enterkeytypeSend')
            expect(obj.$attrs.enterkeytype).assertEqual('send')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputEnterkeytypeSearch
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputEnterkeytypeSearch', Level.LEVEL0, async function(done) {
            console.info('testInputEnterkeytypeSearch START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.enterkeytypeSearch);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('enterkeytypeSearch')
            expect(obj.$attrs.enterkeytype).assertEqual('search')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputHeadericon
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputHeadericon', Level.LEVEL0, async function(done) {
            console.info('testInputHeadericon START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.headericon);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('headericon')
            expect(obj.$attrs.headericon).assertEqual('../../../common/images/icon.png')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputHeadericonNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputHeadericonNone', Level.LEVEL0, async function(done) {
            console.info('testInputHeadericonNone START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.headericonNone);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('headericonNone')
            expect(obj.$attrs.headericon).assertEqual(undefined)
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputShowcounterTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputShowcounterTrue', Level.LEVEL0, async function(done) {
            console.info('testInputShowcounterTrue START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showcounterTrue);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('showcounterTrue')
            expect(obj.$attrs.maxlength).assertEqual('10')
            expect(obj.$attrs.showcounter).assertEqual('true')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputShowcounterFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputShowcounterFalse', Level.LEVEL0, async function(done) {
            console.info('testInputShowcounterFalse START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showcounterFalse);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('showcounterFalse')
            expect(obj.$attrs.maxlength).assertEqual('10')
            expect(obj.$attrs.showcounter).assertEqual('false')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputShowcounterNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputShowcounterNone', Level.LEVEL0, async function(done) {
            console.info('testInputShowcounterNone START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showcounterNone);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('showcounterNone')
            expect(obj.$attrs.maxlength).assertEqual(undefined)
            expect(obj.$attrs.showcounter).assertEqual('false')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputSelectedstart
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputSelectedstart', Level.LEVEL0, async function(done) {
            console.info('testInputSelectedstart START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.selectedstart);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('selectedstart')
            expect(obj.$attrs.selectedstart).assertEqual('0')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputSelectedstartNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputSelectedstartNone', Level.LEVEL0, async function(done) {
            console.info('testInputSelectedstartNone START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.selectedstartNone);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('selectedstartNone')
            expect(obj.$attrs.selectedstart).assertEqual('-1')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputSelectedendTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputSelectedendTrue', Level.LEVEL0, async function(done) {
            console.info('testInputSelectedendTrue START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.selectedendTrue);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('selectedendTrue')
            expect(obj.$attrs.selectedend).assertEqual('10')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputSelectedendNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputSelectedendNone', Level.LEVEL0, async function(done) {
            console.info('testInputSelectedendNone START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.selectedendNone);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('selectedendNone')
            expect(obj.$attrs.selectedend).assertEqual('-1')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputSoftkeyboardenabledTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputSoftkeyboardenabledTrue', Level.LEVEL0, async function(done) {
            console.info('testInputSoftkeyboardenabledTrue START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.softkeyboardenabledTrue);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('softkeyboardenabledTrue')
            expect(obj.$attrs.softkeyboardenabled).assertEqual('true')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputSoftkeyboardenabledFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputSoftkeyboardenabledFalse', Level.LEVEL0, async function(done) {
            console.info('testInputSoftkeyboardenabledFalse START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.softkeyboardenabledFalse);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('softkeyboardenabledFalse')
            expect(obj.$attrs.softkeyboardenabled).assertEqual('false')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputSoftkeyboardenabledNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputSoftkeyboardenabledNone', Level.LEVEL0, async function(done) {
            console.info('testInputSoftkeyboardenabledNone START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.softkeyboardenabledNone);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('softkeyboardenabledNone')
            expect(obj.$attrs.softkeyboardenabled).assertEqual('true')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputShowpasswordiconTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputShowpasswordiconTrue', Level.LEVEL0, async function(done) {
            console.info('testInputShowpasswordiconTrue START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showpasswordiconTrue);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('showpasswordiconTrue')
            expect(obj.$attrs.type).assertEqual('password')
            expect(obj.$attrs.showpasswordicon).assertEqual('true')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputShowpasswordiconFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputShowpasswordiconFalse', Level.LEVEL0, async function(done) {
            console.info('testInputShowpasswordiconFalse START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showpasswordiconFalse);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('showpasswordiconFalse')
            expect(obj.$attrs.type).assertEqual('password')
            expect(obj.$attrs.showpasswordicon).assertEqual('false')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testInputShowpasswordiconNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputShowpasswordiconNone', Level.LEVEL0, async function(done) {
            console.info('testInputShowpasswordiconNone START');
            console.info("[inputProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showpasswordiconNone);
            console.info("[inputProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[inputProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('input')
            expect(obj.$attrs.id).assertEqual('showpasswordiconNone')
            expect(obj.$attrs.type).assertEqual('password')
            expect(obj.$attrs.showpasswordicon).assertEqual('true')
            console.info("[inputProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });
    });
}