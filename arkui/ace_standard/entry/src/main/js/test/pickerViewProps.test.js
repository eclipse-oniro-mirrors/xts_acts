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


export default function undo() {
    describe('pickerViewPropsJsTest', function() {

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
            console.info('[pickerViewPropsJsTest] before each called')

            let result;
            let options = {
                uri: 'pages/pickerView/prop/index'
            }
            try {
                result = router.push(options)
                console.info("push pickerViewProps page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push pickerViewProps page error " + JSON.stringify(result));
            }
            await sleep(4000)
            done()
        })

        /**
         * run after testcase
         */
        afterAll(async function() {
            console.info('[pickerViewPropsJsTest] after each called')
            await backToIndex()
            await sleep(1000)
        })

        /**
         * @tc.name   testPickerViewIdProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewIdProp', Level.LEVEL0, async function(done) {
            console.info('testPickerViewIdProp START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.idProp);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('idProp')
            done();
        });

        /**
         * @tc.name   testPickerViewClassProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewClassProp', Level.LEVEL0, async function(done) {
            console.info('testPickerViewClassProp START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classProp);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('classProp')
            expect(obj.$attrs.className).assertEqual('classProp')
            done();
        });

        /**
         * @tc.name   testPickerViewClassPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewClassPropNone', Level.LEVEL0, async function(done) {
            console.info('testPickerViewClassPropNone START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classPropNone);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('classPropNone')
            expect(obj.$attrs.className).assertEqual(undefined)
            console.info("[pickerViewProps] get className value is: " + JSON.stringify(obj.$attrs.className));
            done();
        });

        /**
         * @tc.name   testPickerViewRefProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewRefProp', Level.LEVEL0, async function(done) {
            console.info('testPickerViewRefProp START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refProp);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('refProp')
            expect(obj.$attrs.ref).assertEqual('refProp')
            done();
        });

        /**
         * @tc.name   testPickerViewRefPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewRefPropNone', Level.LEVEL0, async function(done) {
            console.info('testPickerViewRefPropNone START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refPropNone);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('refPropNone')
            expect(obj.$attrs.ref).assertEqual(undefined)
            console.info("[pickerViewProps] get ref value is: " + JSON.stringify(obj.$attrs.ref));
            done();
        });

        /**
         * @tc.name   testPickerViewDisabledPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewDisabledPropTrue', Level.LEVEL0, async function(done) {
            console.info('testPickerViewDisabledPropTrue START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropTrue);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('disabledPropTrue')
            expect(obj.$attrs.disabled).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testPickerViewDisabledPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewDisabledPropFalse', Level.LEVEL0, async function(done) {
            console.info('testPickerViewDisabledPropFalse START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropFalse);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('disabledPropFalse')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testPickerViewDisabledPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewDisabledPropNone', Level.LEVEL0, async function(done) {
            console.info('testPickerViewDisabledPropNone START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropNone);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('disabledPropNone')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testPickerViewFocusablePropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewFocusablePropTrue', Level.LEVEL0, async function(done) {
            console.info('testPickerViewFocusablePropTrue START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropTrue);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('focusablePropTrue')
            expect(obj.$attrs.focusable).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testPickerViewFocusablePropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewFocusablePropFalse', Level.LEVEL0, async function(done) {
            console.info('testPickerViewFocusablePropFalse START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropFalse);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('focusablePropFalse')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testPickerViewFocusablePropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewFocusablePropNone', Level.LEVEL0, async function(done) {
            console.info('testPickerViewFocusablePropNone START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropNone);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('focusablePropNone')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testPickerViewDataProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewDataProp', Level.LEVEL0, async function(done) {
            console.info('testPickerViewDataProp START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataProp);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('dataProp')
            expect(obj.$attrs.datapickerView).assertEqual(undefined);
            console.info("[pickerViewProps] get datapickerView value is: " + JSON.stringify(obj.$attrs.datapickerView));
            done();
        });

        /**
         * @tc.name   testPickerViewDataPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewDataPropNone', Level.LEVEL0, async function(done) {
            console.info('testPickerViewDataPropNone START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataPropNone);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('dataPropNone')
            expect(obj.$attrs.datapickerView).assertEqual(undefined)
            console.info("[pickerViewProps] get datapickerView value is: " + JSON.stringify(obj.$attrs.datapickerView));
            done();
        });

        /**
         * @tc.name   testPickerViewClickEffectPropSmall
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewClickEffectPropSmall', Level.LEVEL0, async function(done) {
            console.info('testPickerViewClickEffectPropSmall START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropSmall);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('clickEffectPropSmall')
            expect(obj.$attrs.clickEffect).assertEqual('spring-small')
            done();
        });

        /**
         * @tc.name   testPickerViewClickEffectPropMedium
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewClickEffectPropMedium', Level.LEVEL0, async function(done) {
            console.info('testPickerViewClickEffectPropMedium START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropMedium);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('clickEffectPropMedium')
            expect(obj.$attrs.clickEffect).assertEqual('spring-medium')
            done();
        });

        /**
         * @tc.name   testPickerViewClickEffectPropLarge
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewClickEffectPropLarge', Level.LEVEL0, async function(done) {
            console.info('testPickerViewClickEffectPropLarge START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropLarge);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('clickEffectPropLarge')
            expect(obj.$attrs.clickEffect).assertEqual('spring-large')
            done();
        });

        /**
         * @tc.name   testPickerViewClickEffectPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewClickEffectPropNone', Level.LEVEL0, async function(done) {
            console.info('testPickerViewClickEffectPropNone START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropNone);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('clickEffectPropNone')
            expect(obj.$attrs.clickEffect).assertEqual(undefined)
            console.info("[pickerViewProps] get clickEffect value is: " + JSON.stringify(obj.$attrs.clickEffect));
            done();
        });

        /**
         * @tc.name   testPickerViewDirPropRtl
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewDirPropRtl', Level.LEVEL0, async function(done) {
            console.info('testPickerViewDirPropRtl START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropRtl);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('dirPropRtl')
            expect(obj.$attrs.dir).assertEqual('rtl')
            done();
        });

        /**
         * @tc.name   testPickerViewDirPropLtr
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewDirPropLtr', Level.LEVEL0, async function(done) {
            console.info('testPickerViewDirPropLtr START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropLtr);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('dirPropLtr')
            expect(obj.$attrs.dir).assertEqual('ltr')
            done();
        });

        /**
         * @tc.name   testPickerViewDirPropAuto
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewDirPropAuto', Level.LEVEL0, async function(done) {
            console.info('testPickerViewDirPropAuto START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropAuto);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('dirPropAuto')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testPickerViewDirPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewDirPropNone', Level.LEVEL0, async function(done) {
            console.info('testPickerViewDirPropNone START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropNone);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('dirPropNone')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testPickerViewForPropNull
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewForPropNull', Level.LEVEL0, async function(done) {
            console.info('testPickerViewForPropNull START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropNull);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('forPropNull')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[pickerViewProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testPickerViewForPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewForPropOne', Level.LEVEL0, async function(done) {
            console.info('testPickerViewForPropOne START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropOne);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('forPropOne')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[pickerViewProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testPickerViewForPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewForPropThree', Level.LEVEL0, async function(done) {
            console.info('testPickerViewForPropThree START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropThree);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('forPropThree')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[pickerViewProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testPickerViewIfPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewIfPropTrue', Level.LEVEL0, async function(done) {
            console.info('testPickerViewIfPropTrue START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.ifPropTrue);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('ifPropTrue')
            expect(obj.$attrs.if).assertEqual(undefined)
            console.info("[pickerViewProps] get for value is: " + JSON.stringify(obj.$attrs.if));
            done();
        });

        /**
         * @tc.name   testPickerViewShowPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewShowPropTrue', Level.LEVEL0, async function(done) {
            console.info('testPickerViewShowPropTrue START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropTrue);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('showPropTrue')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[pickerViewProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testPickerViewShowPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewShowPropFalse', Level.LEVEL0, async function(done) {
            console.info('testPickerViewShowPropFalse START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropFalse);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('showPropFalse')
            expect(obj.$attrs.show).assertEqual('false')
            console.info("[pickerViewProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testPickerViewShowPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewShowPropNone', Level.LEVEL0, async function(done) {
            console.info('testPickerViewShowPropNone START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropNone);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('showPropNone')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[pickerViewProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testPickerViewPickerViewText
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewPickerViewText', Level.LEVEL0, async function(done) {
            console.info('testPickerViewPickerViewText START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.pickerViewText);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('pickerViewText')
            expect(obj.$attrs.type).assertEqual('text')
            console.info("[pickerViewProps] get type value is: " + JSON.stringify(obj.$attrs.type));
            done();
        });

        /**
         * @tc.name   testPickerViewPickerViewTime
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewPickerViewTime', Level.LEVEL0, async function(done) {
            console.info('testPickerViewPickerViewTime START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.pickerViewTime);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('pickerViewTime')
            expect(obj.$attrs.type).assertEqual('time')
            console.info("[pickerViewProps] get type value is: " + JSON.stringify(obj.$attrs.type));
            done();
        });

        /**
         * @tc.name   testPickerViewPickerViewDate
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewPickerViewDate', Level.LEVEL0, async function(done) {
            console.info('testPickerViewPickerViewDate START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.pickerViewDate);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('pickerViewDate')
            expect(obj.$attrs.type).assertEqual('date')
            console.info("[pickerViewProps] get type value is: " + JSON.stringify(obj.$attrs.type));
            done();
        });

        /**
         * @tc.name   testPickerViewPickerViewDatetime
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewPickerViewDatetime', Level.LEVEL0, async function(done) {
            console.info('testPickerViewPickerViewDatetime START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.pickerViewDatetime);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('pickerViewDatetime')
            expect(obj.$attrs.type).assertEqual('datetime')
            console.info("[pickerViewProps] get type value is: " + JSON.stringify(obj.$attrs.type));
            done();
        });

        /**
         * @tc.name   testPickerViewPickerViewMultiText
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewPickerViewMultiText', Level.LEVEL0, async function(done) {
            console.info('testPickerViewPickerViewMultiText START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.pickerViewMultiText);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('pickerViewMultiText')
            expect(obj.$attrs.type).assertEqual('multi-text')
            console.info("[pickerViewProps] get type value is: " + JSON.stringify(obj.$attrs.type));
            done();
        });
    });
}