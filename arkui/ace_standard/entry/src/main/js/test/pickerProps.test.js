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


export default function pickerPropsJsTest() {
    describe('pickerPropsJsTest', function() {

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
            })
            let clearPromise = new Promise((resolve, reject) => {
                setTimeout(() => {
                    router.clear();
                    resolve();
                }, 500);
            })
            await backToIndexPromise.then(() => {
                return clearPromise;
            })
        }

        /**
         * run before testcase
         */
        beforeAll(async function(done) {
            console.info('[pickerPropsJsTest] before each called')

            let result;
            let options = {
                uri: 'pages/picker/prop/index'
            }
            try {
                result = router.push(options)
                console.info("push pickerProps page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push pickerProps page error " + JSON.stringify(result));
            }
            await sleep(37000)
            done()
        })

        /**
         * run after testcase
         */
        afterAll(async function() {
            console.info('[pickerPropsJsTest] after each called')
            await backToIndex()
            await sleep(1000)
        })

        /**
         * @tc.name   testPickerIdProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerIdProp', Level.LEVEL0, async function(done) {
            console.info('testPickerIdProp START');
            console.info("[pickerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.idProp);
            console.info("[pickerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker')
            expect(obj.$attrs.id).assertEqual('idProp')
            done();
        });

        /**
         * @tc.name   testPickerClassProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerClassProp', Level.LEVEL0, async function(done) {
            console.info('testPickerClassProp START');
            console.info("[pickerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classProp);
            console.info("[pickerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker')
            expect(obj.$attrs.id).assertEqual('classProp')
            expect(obj.$attrs.className).assertEqual('classProp')
            done();
        });

        /**
         * @tc.name   testPickerClassPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerClassPropNone', Level.LEVEL0, async function(done) {
            console.info('testPickerClassPropNone START');
            console.info("[pickerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classPropNone);
            console.info("[pickerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker')
            expect(obj.$attrs.id).assertEqual('classPropNone')
            expect(obj.$attrs.className).assertEqual(undefined)
            console.info("[pickerProps] get className value is: " + JSON.stringify(obj.$attrs.className));
            done();
        });

        /**
         * @tc.name   testPickerRefProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerRefProp', Level.LEVEL0, async function(done) {
            console.info('testPickerRefProp START');
            console.info("[pickerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refProp);
            console.info("[pickerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker')
            expect(obj.$attrs.id).assertEqual('refProp')
            expect(obj.$attrs.ref).assertEqual('refProp')
            done();
        });

        /**
         * @tc.name   testPickerRefPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerRefPropNone', Level.LEVEL0, async function(done) {
            console.info('testPickerRefPropNone START');
            console.info("[pickerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refPropNone);
            console.info("[pickerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker')
            expect(obj.$attrs.id).assertEqual('refPropNone')
            expect(obj.$attrs.ref).assertEqual(undefined)
            console.info("[pickerProps] get ref value is: " + JSON.stringify(obj.$attrs.ref));
            done();
        });

        /**
         * @tc.name   testPickerDisabledPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerDisabledPropTrue', Level.LEVEL0, async function(done) {
            console.info('testPickerDisabledPropTrue START');
            console.info("[pickerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropTrue);
            console.info("[pickerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker')
            expect(obj.$attrs.id).assertEqual('disabledPropTrue')
            expect(obj.$attrs.disabled).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testPickerDisabledPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerDisabledPropFalse', Level.LEVEL0, async function(done) {
            console.info('testPickerDisabledPropFalse START');
            console.info("[pickerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropFalse);
            console.info("[pickerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker')
            expect(obj.$attrs.id).assertEqual('disabledPropFalse')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testPickerDisabledPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerDisabledPropNone', Level.LEVEL0, async function(done) {
            console.info('testPickerDisabledPropNone START');
            console.info("[pickerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropNone);
            console.info("[pickerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker')
            expect(obj.$attrs.id).assertEqual('disabledPropNone')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testPickerFocusablePropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerFocusablePropTrue', Level.LEVEL0, async function(done) {
            console.info('testPickerFocusablePropTrue START');
            console.info("[pickerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropTrue);
            console.info("[pickerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker')
            expect(obj.$attrs.id).assertEqual('focusablePropTrue')
            expect(obj.$attrs.focusable).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testPickerFocusablePropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerFocusablePropFalse', Level.LEVEL0, async function(done) {
            console.info('testPickerFocusablePropFalse START');
            console.info("[pickerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropFalse);
            console.info("[pickerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker')
            expect(obj.$attrs.id).assertEqual('focusablePropFalse')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testPickerFocusablePropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerFocusablePropNone', Level.LEVEL0, async function(done) {
            console.info('testPickerFocusablePropNone START');
            console.info("[pickerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropNone);
            console.info("[pickerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker')
            expect(obj.$attrs.id).assertEqual('focusablePropNone')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testPickerDataProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerDataProp', Level.LEVEL0, async function(done) {
            console.info('testPickerDataProp START');
            console.info("[pickerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataProp);
            console.info("[pickerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker')
            expect(obj.$attrs.id).assertEqual('dataProp')
            expect(obj.$attrs.datapicker).assertEqual(undefined);
            console.info("[pickerProps] get datapicker value is: " + JSON.stringify(obj.$attrs.datapicker));
            done();
        });

        /**
         * @tc.name   testPickerDataPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerDataPropNone', Level.LEVEL0, async function(done) {
            console.info('testPickerDataPropNone START');
            console.info("[pickerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataPropNone);
            console.info("[pickerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker')
            expect(obj.$attrs.id).assertEqual('dataPropNone')
            expect(obj.$attrs.datapicker).assertEqual(undefined)
            console.info("[pickerProps] get datapicker value is: " + JSON.stringify(obj.$attrs.datapicker));
            done();
        });

        /**
         * @tc.name   testPickerClickEffectPropSmall
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerClickEffectPropSmall', Level.LEVEL0, async function(done) {
            console.info('testPickerClickEffectPropSmall START');
            console.info("[pickerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropSmall);
            console.info("[pickerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker')
            expect(obj.$attrs.id).assertEqual('clickEffectPropSmall')
            expect(obj.$attrs.clickEffect).assertEqual('spring-small')
            done();
        });

        /**
         * @tc.name   testPickerClickEffectPropMedium
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerClickEffectPropMedium', Level.LEVEL0, async function(done) {
            console.info('testPickerClickEffectPropMedium START');
            console.info("[pickerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropMedium);
            console.info("[pickerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker')
            expect(obj.$attrs.id).assertEqual('clickEffectPropMedium')
            expect(obj.$attrs.clickEffect).assertEqual('spring-medium')
            done();
        });

        /**
         * @tc.name   testPickerClickEffectPropLarge
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerClickEffectPropLarge', Level.LEVEL0, async function(done) {
            console.info('testPickerClickEffectPropLarge START');
            console.info("[pickerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropLarge);
            console.info("[pickerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker')
            expect(obj.$attrs.id).assertEqual('clickEffectPropLarge')
            expect(obj.$attrs.clickEffect).assertEqual('spring-large')
            done();
        });

        /**
         * @tc.name   testPickerClickEffectPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerClickEffectPropNone', Level.LEVEL0, async function(done) {
            console.info('testPickerClickEffectPropNone START');
            console.info("[pickerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropNone);
            console.info("[pickerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker')
            expect(obj.$attrs.id).assertEqual('clickEffectPropNone')
            expect(obj.$attrs.clickEffect).assertEqual(undefined)
            console.info("[pickerProps] get clickEffect value is: " + JSON.stringify(obj.$attrs.clickEffect));
            done();
        });

        /**
         * @tc.name   testPickerDirPropRtl
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerDirPropRtl', Level.LEVEL0, async function(done) {
            console.info('testPickerDirPropRtl START');
            console.info("[pickerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropRtl);
            console.info("[pickerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker')
            expect(obj.$attrs.id).assertEqual('dirPropRtl')
            expect(obj.$attrs.dir).assertEqual('rtl')
            done();
        });

        /**
         * @tc.name   testPickerDirPropLtr
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerDirPropLtr', Level.LEVEL0, async function(done) {
            console.info('testPickerDirPropLtr START');
            console.info("[pickerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropLtr);
            console.info("[pickerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker')
            expect(obj.$attrs.id).assertEqual('dirPropLtr')
            expect(obj.$attrs.dir).assertEqual('ltr')
            done();
        });

        /**
         * @tc.name   testPickerDirPropAuto
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerDirPropAuto', Level.LEVEL0, async function(done) {
            console.info('testPickerDirPropAuto START');
            console.info("[pickerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropAuto);
            console.info("[pickerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker')
            expect(obj.$attrs.id).assertEqual('dirPropAuto')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testPickerDirPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerDirPropNone', Level.LEVEL0, async function(done) {
            console.info('testPickerDirPropNone START');
            console.info("[pickerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropNone);
            console.info("[pickerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker')
            expect(obj.$attrs.id).assertEqual('dirPropNone')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testPickerForPropNull
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerForPropNull', Level.LEVEL0, async function(done) {
            console.info('testPickerForPropNull START');
            console.info("[pickerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropNull);
            console.info("[pickerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker')
            expect(obj.$attrs.id).assertEqual('forPropNull')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[pickerProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testPickerForPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerForPropOne', Level.LEVEL0, async function(done) {
            console.info('testPickerForPropOne START');
            console.info("[pickerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropOne);
            console.info("[pickerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker')
            expect(obj.$attrs.id).assertEqual('forPropOne')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[pickerProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testPickerForPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerForPropThree', Level.LEVEL0, async function(done) {
            console.info('testPickerForPropThree START');
            console.info("[pickerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropThree);
            console.info("[pickerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker')
            expect(obj.$attrs.id).assertEqual('forPropThree')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[pickerProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testPickerIfPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerIfPropTrue', Level.LEVEL0, async function(done) {
            console.info('testPickerIfPropTrue START');
            console.info("[pickerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.ifPropTrue);
            console.info("[pickerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker')
            expect(obj.$attrs.id).assertEqual('ifPropTrue')
            expect(obj.$attrs.if).assertEqual(undefined)
            console.info("[pickerProps] get for value is: " + JSON.stringify(obj.$attrs.if));
            done();
        });

        /**
         * @tc.name   testPickerShowPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerShowPropTrue', Level.LEVEL0, async function(done) {
            console.info('testPickerShowPropTrue START');
            console.info("[pickerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropTrue);
            console.info("[pickerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker')
            expect(obj.$attrs.id).assertEqual('showPropTrue')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[pickerProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testPickerShowPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerShowPropFalse', Level.LEVEL0, async function(done) {
            console.info('testPickerShowPropFalse START');
            console.info("[pickerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropFalse);
            console.info("[pickerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker')
            expect(obj.$attrs.id).assertEqual('showPropFalse')
            expect(obj.$attrs.show).assertEqual('false')
            console.info("[pickerProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testPickerShowPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerShowPropNone', Level.LEVEL0, async function(done) {
            console.info('testPickerShowPropNone START');
            console.info("[pickerProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropNone);
            console.info("[pickerProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker')
            expect(obj.$attrs.id).assertEqual('showPropNone')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[pickerProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });


    });
}