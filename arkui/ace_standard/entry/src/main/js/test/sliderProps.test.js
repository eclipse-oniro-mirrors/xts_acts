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

export default function sliderPropsJsTest() {
    describe('sliderPropsJsTest', function() {

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
            console.info('[sliderPropsJsTest] before each called')

            let result;
            let options = {
                uri: 'pages/slider/prop/index'
            }
            try {
                result = router.push(options)
                console.info("push sliderProps page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push sliderProps page error " + JSON.stringify(result));
            }
            await sleep(4000)
            done()
        });

        /**
         * run after testcase
         */
        afterAll(async function() {
            console.info('[sliderPropsJsTest] after each called')
            await backToIndex()
            await sleep(1000)
        });

        /**
         * @tc.name   testSliderIdProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderIdProp', Level.LEVEL0, async function(done) {
            console.info('testSliderIdProp START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.idProp);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('idProp')
            done();
        });

        /**
         * @tc.name   testSliderClassProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderClassProp', Level.LEVEL0, async function(done) {
            console.info('testSliderClassProp START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classProp);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('classProp')
            expect(obj.$attrs.className).assertEqual('classProp')
            done();
        });

        /**
         * @tc.name   testSliderClassPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderClassPropNone', Level.LEVEL0, async function(done) {
            console.info('testSliderClassPropNone START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classPropNone);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('classPropNone')
            expect(obj.$attrs.className).assertEqual(undefined)
            console.info("[sliderProps] get className value is: " + JSON.stringify(obj.$attrs.className));
            done();
        });

        /**
         * @tc.name   testSliderRefProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderRefProp', Level.LEVEL0, async function(done) {
            console.info('testSliderRefProp START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refProp);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('refProp')
            expect(obj.$attrs.ref).assertEqual('refProp')
            done();
        });

        /**
         * @tc.name   testSliderRefPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderRefPropNone', Level.LEVEL0, async function(done) {
            console.info('testSliderRefPropNone START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refPropNone);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('refPropNone')
            expect(obj.$attrs.ref).assertEqual(undefined)
            console.info("[sliderProps] get ref value is: " + JSON.stringify(obj.$attrs.ref));
            done();
        });

        /**
         * @tc.name   testSliderDisabledPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderDisabledPropTrue', Level.LEVEL0, async function(done) {
            console.info('testSliderDisabledPropTrue START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropTrue);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('disabledPropTrue')
            expect(obj.$attrs.disabled).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testSliderDisabledPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderDisabledPropFalse', Level.LEVEL0, async function(done) {
            console.info('testSliderDisabledPropFalse START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropFalse);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('disabledPropFalse')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testSliderDisabledPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderDisabledPropNone', Level.LEVEL0, async function(done) {
            console.info('testSliderDisabledPropNone START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropNone);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('disabledPropNone')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testSliderFocusablePropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderFocusablePropTrue', Level.LEVEL0, async function(done) {
            console.info('testSliderFocusablePropTrue START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropTrue);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('focusablePropTrue')
            expect(obj.$attrs.focusable).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testSliderFocusablePropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderFocusablePropFalse', Level.LEVEL0, async function(done) {
            console.info('testSliderFocusablePropFalse START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropFalse);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('focusablePropFalse')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testSliderFocusablePropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderFocusablePropNone', Level.LEVEL0, async function(done) {
            console.info('testSliderFocusablePropNone START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropNone);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('focusablePropNone')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testSliderDataProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderDataProp', Level.LEVEL0, async function(done) {
            console.info('testSliderDataProp START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataProp);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('dataProp')
            expect(obj.$attrs.dataSlider).assertEqual(undefined);
            console.info("[sliderProps] get dataSlider value is: " + JSON.stringify(obj.$attrs.dataSlider));
            done();
        });

        /**
         * @tc.name   testSliderDataPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderDataPropNone', Level.LEVEL0, async function(done) {
            console.info('testSliderDataPropNone START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataPropNone);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('dataPropNone')
            expect(obj.$attrs.dataSlider).assertEqual(undefined)
            console.info("[sliderProps] get dataSlider value is: " + JSON.stringify(obj.$attrs.dataSlider));
            done();
        });

        /**
         * @tc.name   testSliderClickEffectPropSmall
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderClickEffectPropSmall', Level.LEVEL0, async function(done) {
            console.info('testSliderClickEffectPropSmall START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropSmall);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('clickEffectPropSmall')
            expect(obj.$attrs.clickEffect).assertEqual('spring-small')
            done();
        });

        /**
         * @tc.name   testSliderClickEffectPropMedium
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderClickEffectPropMedium', Level.LEVEL0, async function(done) {
            console.info('testSliderClickEffectPropMedium START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropMedium);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('clickEffectPropMedium')
            expect(obj.$attrs.clickEffect).assertEqual('spring-medium')
            done();
        });

        /**
         * @tc.name   testSliderClickEffectPropLarge
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderClickEffectPropLarge', Level.LEVEL0, async function(done) {
            console.info('testSliderClickEffectPropLarge START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropLarge);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('clickEffectPropLarge')
            expect(obj.$attrs.clickEffect).assertEqual('spring-large')
            done();
        });

        /**
         * @tc.name   testSliderClickEffectPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderClickEffectPropNone', Level.LEVEL0, async function(done) {
            console.info('testSliderClickEffectPropNone START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropNone);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('clickEffectPropNone')
            expect(obj.$attrs.clickEffect).assertEqual(undefined)
            console.info("[sliderProps] get clickEffect value is: " + JSON.stringify(obj.$attrs.clickEffect));
            done();
        });

        /**
         * @tc.name   testSliderDirPropRtl
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderDirPropRtl', Level.LEVEL0, async function(done) {
            console.info('testSliderDirPropRtl START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropRtl);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('dirPropRtl')
            expect(obj.$attrs.dir).assertEqual('rtl')
            done();
        });

        /**
         * @tc.name   testSliderDirPropLtr
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderDirPropLtr', Level.LEVEL0, async function(done) {
            console.info('testSliderDirPropLtr START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropLtr);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('dirPropLtr')
            expect(obj.$attrs.dir).assertEqual('ltr')
            done();
        });

        /**
         * @tc.name   testSliderDirPropAuto
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderDirPropAuto', Level.LEVEL0, async function(done) {
            console.info('testSliderDirPropAuto START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropAuto);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('dirPropAuto')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testSliderDirPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderDirPropNone', Level.LEVEL0, async function(done) {
            console.info('testSliderDirPropNone START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropNone);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('dirPropNone')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testSliderForPropNull
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderForPropNull', Level.LEVEL0, async function(done) {
            console.info('testSliderForPropNull START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropNull);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('forPropNull')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[sliderProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testSliderForPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderForPropOne', Level.LEVEL0, async function(done) {
            console.info('testSliderForPropOne START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropOne);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('forPropOne')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[sliderProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testSliderForPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderForPropThree', Level.LEVEL0, async function(done) {
            console.info('testSliderForPropThree START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropThree);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('forPropThree')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[sliderProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testSliderIfPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderIfPropTrue', Level.LEVEL0, async function(done) {
            console.info('testSliderIfPropTrue START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.ifPropTrue);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('ifPropTrue')
            expect(obj.$attrs.if).assertEqual(undefined)
            console.info("[sliderProps] get for value is: " + JSON.stringify(obj.$attrs.if));
            done();
        });

        /**
         * @tc.name   testSliderShowPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderShowPropTrue', Level.LEVEL0, async function(done) {
            console.info('testSliderShowPropTrue START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropTrue);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('showPropTrue')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[sliderProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testSliderShowPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderShowPropFalse', Level.LEVEL0, async function(done) {
            console.info('testSliderShowPropFalse START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropFalse);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('showPropFalse')
            expect(obj.$attrs.show).assertEqual('false')
            console.info("[sliderProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testSliderShowPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderShowPropNone', Level.LEVEL0, async function(done) {
            console.info('testSliderShowPropNone START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropNone);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('showPropNone')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[sliderProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testSliderMin
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderMin', Level.LEVEL0, async function(done) {
            console.info('testSliderMin START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.min);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('min')
            expect(obj.$attrs.min).assertEqual('2')
            console.info("[sliderProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testSliderMax
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderMax', Level.LEVEL0, async function(done) {
            console.info('testSliderMax START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.max);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('max')
            expect(obj.$attrs.max).assertEqual('100')
            console.info("[sliderProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testSliderMaxNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderMaxNone', Level.LEVEL0, async function(done) {
            console.info('testSliderMaxNone START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.maxNone);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('maxNone')
            expect(obj.$attrs.max).assertEqual('100')
            console.info("[sliderProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testSliderStep
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderStep', Level.LEVEL0, async function(done) {
            console.info('testSliderStep START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.step);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('step')
            expect(obj.$attrs.step).assertEqual('2')
            console.info("[sliderProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testSliderStepNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderStepNone', Level.LEVEL0, async function(done) {
            console.info('testSliderStepNone START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.stepNone);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('stepNone')
            expect(obj.$attrs.step).assertEqual('1')
            console.info("[sliderProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testSliderValue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderValue', Level.LEVEL0, async function(done) {
            console.info('testSliderValue START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.value);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('value')
            expect(obj.$attrs.value).assertEqual('10')
            console.info("[sliderProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testSliderTypeContinuous
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderTypeContinuous', Level.LEVEL0, async function(done) {
            console.info('testSliderTypeContinuous START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeContinuous);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('typeContinuous')
            expect(obj.$attrs.type).assertEqual('continuous')
            console.info("[sliderProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testSliderTypeIntermittent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderTypeIntermittent', Level.LEVEL0, async function(done) {
            console.info('testSliderTypeIntermittent START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeIntermittent);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('typeIntermittent')
            expect(obj.$attrs.type).assertEqual('intermittent')
            console.info("[sliderProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testSliderTypeNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderTypeNone', Level.LEVEL0, async function(done) {
            console.info('testSliderTypeNone START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeNone);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('typeNone')
            expect(obj.$attrs.type).assertEqual('continuous')
            console.info("[sliderProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testSliderMinicon
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderMinicon', Level.LEVEL0, async function(done) {
            console.info('testSliderMinicon START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.minicon);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('minicon')
            expect(obj.$attrs.minicon).assertEqual('../../../common/images/icon.png')
            console.info("[sliderProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testSliderMiniconNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderMiniconNone', Level.LEVEL0, async function(done) {
            console.info('testSliderMiniconNone START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.miniconNone);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('miniconNone')
            expect(obj.$attrs.minicon).assertEqual(undefined)
            console.info("[sliderProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testSliderMaxicon
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderMaxicon', Level.LEVEL0, async function(done) {
            console.info('testSliderMaxicon START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.maxicon);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('maxicon')
            expect(obj.$attrs.maxicon).assertEqual('../../../common/images/icon.png')
            console.info("[sliderProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testSliderMaxiconNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderMaxiconNone', Level.LEVEL0, async function(done) {
            console.info('testSliderMaxiconNone START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.maxiconNone);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('maxiconNone')
            expect(obj.$attrs.maxicon).assertEqual(undefined)
            console.info("[sliderProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testSliderModeOutset
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderModeOutset', Level.LEVEL0, async function(done) {
            console.info('testSliderModeOutset START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.modeOutset);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('modeOutset')
            expect(obj.$attrs.mode).assertEqual('outset')
            console.info("[sliderProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testSliderModeInset
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderModeInset', Level.LEVEL0, async function(done) {
            console.info('testSliderModeInset START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.modeInset);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('modeInset')
            expect(obj.$attrs.mode).assertEqual('inset')
            console.info("[sliderProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testSliderModeNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderModeNone', Level.LEVEL0, async function(done) {
            console.info('testSliderModeNone START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.modeNone);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('modeNone')
            expect(obj.$attrs.mode).assertEqual('outset')
            console.info("[sliderProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testSliderShowstepsTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderShowstepsTrue', Level.LEVEL0, async function(done) {
            console.info('testSliderShowstepsTrue START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showstepsTrue);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('showstepsTrue')
            expect(obj.$attrs.showsteps).assertEqual('true')
            console.info("[sliderProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testSliderShowstepsFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderShowstepsFalse', Level.LEVEL0, async function(done) {
            console.info('testSliderShowstepsFalse START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showstepsFalse);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('showstepsFalse')
            expect(obj.$attrs.showsteps).assertEqual('false')
            console.info("[sliderProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testSliderShowstepsNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderShowstepsNone', Level.LEVEL0, async function(done) {
            console.info('testSliderShowstepsNone START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showstepsNone);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('showstepsNone')
            expect(obj.$attrs.showsteps).assertEqual('false')
            console.info("[sliderProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testSliderShowtipsTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderShowtipsTrue', Level.LEVEL0, async function(done) {
            console.info('testSliderShowtipsTrue START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showtipsTrue);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('showtipsTrue')
            expect(obj.$attrs.showtips).assertEqual('true')
            console.info("[sliderProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testSliderShowtipsFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderShowtipsFalse', Level.LEVEL0, async function(done) {
            console.info('testSliderShowtipsFalse START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showtipsFalse);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('showtipsFalse')
            expect(obj.$attrs.showtips).assertEqual('false')
            console.info("[sliderProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testSliderShowtipsNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderShowtipsNone', Level.LEVEL0, async function(done) {
            console.info('testSliderShowtipsNone START');
            console.info("[sliderProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showtipsNone);
            console.info("[sliderProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[sliderProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('slider')
            expect(obj.$attrs.id).assertEqual('showtipsNone')
            expect(obj.$attrs.showtips).assertEqual('false')
            console.info("[sliderProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });
    });
}