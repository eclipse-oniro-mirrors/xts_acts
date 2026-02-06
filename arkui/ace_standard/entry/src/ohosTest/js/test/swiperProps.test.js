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
    describe('swiperPropsJsTest', function() {

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
            console.info('[swiperPropsJsTest] before each called')

            let result;
            let options = {
                uri: 'pages/swiper/prop/index'
            }
            try {
                result = router.push(options)
                console.info("push swiperProps page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push swiperProps page error " + JSON.stringify(result));
            }
            await sleep(4000)
            done()
        });

        /**
         * run after testcase
         */
        afterAll(async function() {
            console.info('[swiperPropsJsTest] after each called')
            await backToIndex()
            await sleep(1000)
        });

        /**
         * @tc.name   testSwiperIdProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperIdProp', Level.LEVEL0, async function(done) {
            console.info('testSwiperIdProp START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.idProp);
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('idProp')
            done();
        });

        /**
         * @tc.name   testSwiperClassProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperClassProp', Level.LEVEL0, async function(done) {
            console.info('testSwiperClassProp START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classProp);
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('classProp')
            done();
        });

        /**
         * @tc.name   testSwiperClassPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperClassPropNone', Level.LEVEL0, async function(done) {
            console.info('testSwiperClassPropNone START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classPropNone);
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('classPropNone')
            expect(obj.$attrs.className).assertEqual(undefined)
            console.info("[swiperProps] get className value is: " + JSON.stringify(obj.$attrs.className));
            done();
        });

        /**
         * @tc.name   testSwiperRefProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperRefProp', Level.LEVEL0, async function(done) {
            console.info('testSwiperRefProp START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refProp);
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('refProp')
            expect(obj.$attrs.ref).assertEqual('refProp')
            done();
        });

        /**
         * @tc.name   testSwiperRefPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperRefPropNone', Level.LEVEL0, async function(done) {
            console.info('testSwiperRefPropNone START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refPropNone);
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('refPropNone')
            expect(obj.$attrs.ref).assertEqual(undefined)
            console.info("[swiperProps] get ref value is: " + JSON.stringify(obj.$attrs.ref));
            done();
        });

        /**
         * @tc.name   testSwiperDisabledPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperDisabledPropTrue', Level.LEVEL0, async function(done) {
            console.info('testSwiperDisabledPropTrue START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropTrue);
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('disabledPropTrue')
            expect(obj.$attrs.disabled).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testSwiperDisabledPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperDisabledPropFalse', Level.LEVEL0, async function(done) {
            console.info('testSwiperDisabledPropFalse START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropFalse);
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('disabledPropFalse')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testSwiperDisabledPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperDisabledPropNone', Level.LEVEL0, async function(done) {
            console.info('testSwiperDisabledPropNone START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropNone);
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('disabledPropNone')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testSwiperFocusablePropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperFocusablePropTrue', Level.LEVEL0, async function(done) {
            console.info('testSwiperFocusablePropTrue START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropTrue);
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('focusablePropTrue')
            expect(obj.$attrs.focusable).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testSwiperFocusablePropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperFocusablePropFalse', Level.LEVEL0, async function(done) {
            console.info('testSwiperFocusablePropFalse START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropFalse);
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('focusablePropFalse')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testSwiperFocusablePropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperFocusablePropNone', Level.LEVEL0, async function(done) {
            console.info('testSwiperFocusablePropNone START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropNone);
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('focusablePropNone')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testSwiperDataProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperDataProp', Level.LEVEL0, async function(done) {
            console.info('testSwiperDataProp START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataProp);
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('dataProp')
            expect(obj.$attrs.dataSwiper).assertEqual(undefined);
            console.info("[swiperProps] get dataSwiper value is: " + JSON.stringify(obj.$attrs.dataSwiper));
            done();
        });

        /**
         * @tc.name   testSwiperDataPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperDataPropNone', Level.LEVEL0, async function(done) {
            console.info('testSwiperDataPropNone START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataPropNone);
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('dataPropNone')
            expect(obj.$attrs.dataSwiper).assertEqual(undefined)
            console.info("[swiperProps] get dataSwiper value is: " + JSON.stringify(obj.$attrs.dataSwiper));
            done();
        });

        /**
         * @tc.name   testSwiperClickEffectPropSmall
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperClickEffectPropSmall', Level.LEVEL0, async function(done) {
            console.info('testSwiperClickEffectPropSmall START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropSmall);
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('clickEffectPropSmall')
            expect(obj.$attrs.clickEffect).assertEqual('spring-small')
            done();
        });

        /**
         * @tc.name   testSwiperClickEffectPropMedium
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperClickEffectPropMedium', Level.LEVEL0, async function(done) {
            console.info('testSwiperClickEffectPropMedium START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropMedium);
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('clickEffectPropMedium')
            expect(obj.$attrs.clickEffect).assertEqual('spring-medium')
            done();
        });

        /**
         * @tc.name   testSwiperClickEffectPropLarge
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperClickEffectPropLarge', Level.LEVEL0, async function(done) {
            console.info('testSwiperClickEffectPropLarge START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropLarge);
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('clickEffectPropLarge')
            expect(obj.$attrs.clickEffect).assertEqual('spring-large')
            done();
        });

        /**
         * @tc.name   testSwiperClickEffectPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperClickEffectPropNone', Level.LEVEL0, async function(done) {
            console.info('testSwiperClickEffectPropNone START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropNone);
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('clickEffectPropNone')
            expect(obj.$attrs.clickEffect).assertEqual(undefined)
            console.info("[swiperProps] get clickEffect value is: " + JSON.stringify(obj.$attrs.clickEffect));
            done();
        });

        /**
         * @tc.name   testSwiperDirPropRtl
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperDirPropRtl', Level.LEVEL0, async function(done) {
            console.info('testSwiperDirPropRtl START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropRtl);
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('dirPropRtl')
            expect(obj.$attrs.dir).assertEqual('rtl')
            done();
        });

        /**
         * @tc.name   testSwiperDirPropLtr
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperDirPropLtr', Level.LEVEL0, async function(done) {
            console.info('testSwiperDirPropLtr START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropLtr);
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('dirPropLtr')
            expect(obj.$attrs.dir).assertEqual('ltr')
            done();
        });

        /**
         * @tc.name   testSwiperDirPropAuto
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperDirPropAuto', Level.LEVEL0, async function(done) {
            console.info('testSwiperDirPropAuto START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropAuto);
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('dirPropAuto')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testSwiperDirPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperDirPropNone', Level.LEVEL0, async function(done) {
            console.info('testSwiperDirPropNone START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropNone);
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('dirPropNone')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testSwiperForPropNull
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperForPropNull', Level.LEVEL0, async function(done) {
            console.info('testSwiperForPropNull START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropNull);
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('forPropNull')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[swiperProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testSwiperForPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperForPropOne', Level.LEVEL0, async function(done) {
            console.info('testSwiperForPropOne START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropOne);
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('forPropOne')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[swiperProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testSwiperForPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperForPropThree', Level.LEVEL0, async function(done) {
            console.info('testSwiperForPropThree START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropThree);
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('forPropThree')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[swiperProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testSwiperIfPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperIfPropTrue', Level.LEVEL0, async function(done) {
            console.info('testSwiperIfPropTrue START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.ifPropTrue);
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('ifPropTrue')
            expect(obj.$attrs.if).assertEqual(undefined)
            console.info("[swiperProps] get for value is: " + JSON.stringify(obj.$attrs.if));
            done();
        });

        /**
         * @tc.name   testSwiperShowPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperShowPropTrue', Level.LEVEL0, async function(done) {
            console.info('testSwiperShowPropTrue START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropTrue);
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('showPropTrue')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[swiperProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testSwiperShowPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperShowPropFalse', Level.LEVEL0, async function(done) {
            console.info('testSwiperShowPropFalse START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropFalse);
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('showPropFalse')
            expect(obj.$attrs.show).assertEqual('false')
            console.info("[swiperProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testSwiperShowPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperShowPropNone', Level.LEVEL0, async function(done) {
            console.info('testSwiperShowPropNone START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropNone);
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('showPropNone')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[swiperProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testSwiperIndexProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperIndexProp', Level.LEVEL0, async function(done) {
            console.info('testSwiperIndexProp START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.indexProp); //id
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('indexProp') //ID
            expect(obj.$attrs.index).assertEqual('0') // prop and propValue
            console.info("[swiperProps] get index value is: " + JSON.stringify(obj.$attrs.index));
            done();
        });

        /**
         * @tc.name   testSwiperAutoplayPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperAutoplayPropTrue', Level.LEVEL0, async function(done) {
            console.info('testSwiperAutoplayPropTrue START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.autoplayPropTrue); //id
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('autoplayPropTrue') //ID
            expect(obj.$attrs.autoplay).assertEqual('true') // prop and propValue
            console.info("[swiperProps] get autoplay value is: " + JSON.stringify(obj.$attrs.autoplay)); //prop
            done();
        });

        /**
         * @tc.name   testSwiperAutoplayPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperAutoplayPropFalse', Level.LEVEL0, async function(done) {
            console.info('testSwiperAutoplayPropFalse START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.autoplayPropFalse); //id
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('autoplayPropFalse') //ID
            expect(obj.$attrs.autoplay).assertEqual('false') // prop and propValue
            console.info("[swiperProps] get autoplay value is: " + JSON.stringify(obj.$attrs.autoplay)); //prop
            done();
        });

        /**
         * @tc.name   testSwiperIntervalProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperIntervalProp', Level.LEVEL0, async function(done) {
            console.info('testSwiperIntervalProp START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.intervalProp); //id
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('intervalProp') //ID
            expect(obj.$attrs.interval).assertEqual('2000') // prop and propValue
            console.info("[swiperProps] get interval value is: " + JSON.stringify(obj.$attrs.interval)); //prop
            done();
        });

        /**
         * @tc.name   testSwiperIndicatorPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperIndicatorPropTrue', Level.LEVEL0, async function(done) {
            console.info('testSwiperIndicatorPropTrue START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.indicatorPropTrue); //id
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('indicatorPropTrue') //ID
            expect(obj.$attrs.indicator).assertEqual('true') // prop and propValue
            console.info("[swiperProps] get indicator value is: " + JSON.stringify(obj.$attrs.indicator)); //prop
            done();
        });

        /**
         * @tc.name   testSwiperIndicatorPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperIndicatorPropFalse', Level.LEVEL0, async function(done) {
            console.info('testSwiperIndicatorPropFalse START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.indicatorPropFalse); //id
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('indicatorPropFalse') //ID
            expect(obj.$attrs.indicator).assertEqual('false') // prop and propValue
            console.info("[swiperProps] get indicator value is: " + JSON.stringify(obj.$attrs.indicator)); //prop
            done();
        });

        /**
         * @tc.name   testSwiperDigitalPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperDigitalPropTrue', Level.LEVEL0, async function(done) {
            console.info('testSwiperDigitalPropTrue START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.digitalPropTrue); //id
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('digitalPropTrue') //ID
            expect(obj.$attrs.digital).assertEqual('true') // prop and propValue
            console.info("[swiperProps] get digital value is: " + JSON.stringify(obj.$attrs.digital)); //prop
            done();
        });

        /**
         * @tc.name   testSwiperDigitalPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperDigitalPropFalse', Level.LEVEL0, async function(done) {
            console.info('testSwiperDigitalPropFalse START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.digitalPropFalse); //id
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('digitalPropFalse') //ID
            expect(obj.$attrs.digital).assertEqual('false') // prop and propValue
            console.info("[swiperProps] get digital value is: " + JSON.stringify(obj.$attrs.digital)); //prop
            done();
        });

        /**
         * @tc.name   testSwiperIndicatorMaskPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperIndicatorMaskPropTrue', Level.LEVEL0, async function(done) {
            console.info('testSwiperIndicatorMaskPropTrue START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.indicatorMaskPropTrue); //id
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('indicatorMaskPropTrue') //ID
            expect(obj.$attrs.indicatormask).assertEqual('true') // prop and propValue
            console.info("[swiperProps] get indicatormask value is: " + JSON.stringify(obj.$attrs.indicatormask)); //prop
            done();
        });

        /**
         * @tc.name   testSwiperIndicatorMaskPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperIndicatorMaskPropFalse', Level.LEVEL0, async function(done) {
            console.info('testSwiperIndicatorMaskPropFalse START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.indicatorMaskPropFalse); //id
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('indicatorMaskPropFalse') //ID
            expect(obj.$attrs.indicatormask).assertEqual('false') // prop and propValue
            console.info("[swiperProps] get indicatormask value is: " + JSON.stringify(obj.$attrs.indicatormask)); //prop
            done();
        });

        /**
         * @tc.name   testSwiperIndicatorDisabledPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperIndicatorDisabledPropTrue', Level.LEVEL0, async function(done) {
            console.info('testSwiperIndicatorDisabledPropTrue START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.indicatorDisabledPropTrue); //id
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('indicatorDisabledPropTrue') //ID
            expect(obj.$attrs.indicatordisabled).assertEqual('true') // prop and propValue
            console.info("[swiperProps] get indicatordisabled value is: " +
                JSON.stringify(obj.$attrs.indicatordisabled));
            done();
        });

        /**
         * @tc.name   testSwiperIndicatorDisabledPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperIndicatorDisabledPropFalse', Level.LEVEL0, async function(done) {
            console.info('testSwiperIndicatorDisabledPropFalse START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.indicatorDisabledPropTrue); //id
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('indicatorDisabledPropFalse') //ID
            expect(obj.$attrs.indicatordisabled).assertEqual('false') // prop and propValue
            console.info("[swiperProps] get indicatordisabled value is: " +
                JSON.stringify(obj.$attrs.indicatordisabled));
            done();
        });

        /**
         * @tc.name   testSwiperLoopPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperLoopPropTrue', Level.LEVEL0, async function(done) {
            console.info('testSwiperLoopPropTrue START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.loopPropTrue); //id
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('loopPropTrue') //ID
            expect(obj.$attrs.loop).assertEqual('true') // prop and propValue
            console.info("[swiperProps] get loop value is: " + JSON.stringify(obj.$attrs.loop)); //prop
            done();
        });

        /**
         * @tc.name   testSwiperLoopPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperLoopPropFalse', Level.LEVEL0, async function(done) {
            console.info('testSwiperLoopPropFalse START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.loopPropFalse); //id
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('loopPropFalse') //ID
            expect(obj.$attrs.loop).assertEqual('false') // prop and propValue
            console.info("[swiperProps] get loop value is: " + JSON.stringify(obj.$attrs.loop)); //prop
            done();
        });

        /**
         * @tc.name   testSwiperDurationProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperDurationProp', Level.LEVEL0, async function(done) {
            console.info('testSwiperDurationProp START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.durationProp); //id
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('durationProp') //ID
            expect(obj.$attrs.duration).assertEqual('3000') // prop and propValue
            console.info("[swiperProps] get duration value is: " + JSON.stringify(obj.$attrs.duration)); //prop
            done();
        });

        /**
         * @tc.name   testSwiperVerticalPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperVerticalPropTrue', Level.LEVEL0, async function(done) {
            console.info('testSwiperVerticalPropTrue START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.verticalPropTrue); //id
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('verticalPropTrue') //ID
            expect(obj.$attrs.vertical).assertEqual('true') // prop and propValue
            console.info("[swiperProps] get vertical value is: " + JSON.stringify(obj.$attrs.vertical)); //prop
            done();
        });

        /**
         * @tc.name   testSwiperVerticalPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperVerticalPropFalse', Level.LEVEL0, async function(done) {
            console.info('testSwiperVerticalPropFalse START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.verticalPropFalse); //id
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('verticalPropFalse') //ID
            expect(obj.$attrs.vertical).assertEqual('false') // prop and propValue
            console.info("[swiperProps] get vertical value is: " + JSON.stringify(obj.$attrs.vertical)); //prop
            done();
        });

        /**
         * @tc.name   testSwiperCachedSizeProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperCachedSizeProp', Level.LEVEL0, async function(done) {
            console.info('testSwiperCachedSizeProp START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.cachedSizeProp); //id
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('cachedSizeProp') //ID
            expect(obj.$attrs.cachedsize).assertEqual('-1') // prop and propValue
            console.info("[swiperProps] get cachedsize value is: " + JSON.stringify(obj.$attrs.cachedsize)); //prop
            done();
        });

        /**
         * @tc.name   testSwiperScrollEffectPropFade
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperScrollEffectPropFade', Level.LEVEL0, async function(done) {
            console.info('testSwiperScrollEffectPropFade START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.scrollEffectPropFade); //id
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('scrollEffectPropFade') //ID
            expect(obj.$attrs.scrolleffect).assertEqual('fade') // prop and propValue
            console.info("[swiperProps] get scrolleffect value is: " + JSON.stringify(obj.$attrs.scrolleffect)); //prop
            done();
        });

        /**
         * @tc.name   testSwiperScrollEffectPropSpring
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperScrollEffectPropSpring', Level.LEVEL0, async function(done) {
            console.info('testSwiperScrollEffectPropSpring START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.scrollEffectPropSpring); //id
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('scrollEffectPropSpring') //ID
            expect(obj.$attrs.scrolleffect).assertEqual('spring') // prop and propValue
            console.info("[swiperProps] get scrolleffect value is: " + JSON.stringify(obj.$attrs.scrolleffect)); //prop
            done();
        });

        /**
         * @tc.name   testSwiperDisplayModePropStretch
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperDisplayModePropStretch', Level.LEVEL0, async function(done) {
            console.info('testSwiperDisplayModePropStretch START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.displayModePropStretch); //id
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('displayModePropStretch') //ID
            expect(obj.$attrs.displaymode).assertEqual('stretch') // prop and propValue
            console.info("[swiperProps] get displaymode value is: " + JSON.stringify(obj.$attrs.displaymode)); //prop
            done();
        });

        /**
         * @tc.name   testSwiperDisplayModePropAutoLinear
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperDisplayModePropAutoLinear', Level.LEVEL0, async function(done) {
            console.info('testSwiperDisplayModePropAutoLinear START');
            console.info("[swiperProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.displayModePropAutoLinear); //id
            console.info("[swiperProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[swiperProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('swiper')
            expect(obj.$attrs.id).assertEqual('displayModePropAutoLinear') //ID
            expect(obj.$attrs.displaymode).assertEqual('autoLinear') // prop and propValue
            console.info("[swiperProps] get displaymode value is: " + JSON.stringify(obj.$attrs.displaymode)); //prop
            done();
        });
    });
}