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


export default function buttonPropsJsTest() {
    describe('buttonPropsJsTest', function() {

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
            console.info('[buttonPropsJsTest] before each called')

            let result;
            let options = {
                uri: 'pages/button/prop/index'
            }
            try {
                result = router.push(options)
                console.info("push buttonProps page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push buttonProps page error " + JSON.stringify(result));
            }
            await sleep(4000)
            done()
        });

        /**
         * run after testcase
         */
        afterAll(async function() {
            console.info('[buttonPropsJsTest] after each called')
            await backToIndex();
            await sleep(1000)
        });

        // 通用属性

        /**
         * @tc.name   testButtonIdProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonIdProp', Level.LEVEL0, async function(done) {
            console.info('testButtonIdProp START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.idProp);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('idProp')
            done();
        });

        /**
         * @tc.name   testButtonClassProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonClassProp', Level.LEVEL0, async function(done) {
            console.info('testButtonClassProp START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classProp);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('classProp')
            expect(obj.$attrs.className).assertEqual('classProp')
            done();
        });

        /**
         * @tc.name   testButtonClassPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonClassPropNone', Level.LEVEL0, async function(done) {
            console.info('testButtonClassPropNone START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classPropNone);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('classPropNone')
            expect(obj.$attrs.className).assertEqual(undefined)
            console.info("[buttonProps] get className value is: " + JSON.stringify(obj.$attrs.className));
            done();
        });

        /**
         * @tc.name   testButtonRefProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonRefProp', Level.LEVEL0, async function(done) {
            console.info('testButtonRefProp START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refProp);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('refProp')
            expect(obj.$attrs.ref).assertEqual('refProp')
            done();
        });

        /**
         * @tc.name   testButtonRefPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonRefPropNone', Level.LEVEL0, async function(done) {
            console.info('testButtonRefPropNone START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refPropNone);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('refPropNone')
            expect(obj.$attrs.ref).assertEqual(undefined)
            console.info("[buttonProps] get ref value is: " + JSON.stringify(obj.$attrs.ref));
            done();
        });

        /**
         * @tc.name   testButtonDisabledPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonDisabledPropTrue', Level.LEVEL0, async function(done) {
            console.info('testButtonDisabledPropTrue START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropTrue);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('disabledPropTrue')
            expect(obj.$attrs.disabled).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testButtonDisabledPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonDisabledPropFalse', Level.LEVEL0, async function(done) {
            console.info('testButtonDisabledPropFalse START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropFalse);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('disabledPropFalse')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testButtonDisabledPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonDisabledPropNone', Level.LEVEL0, async function(done) {
            console.info('testButtonDisabledPropNone START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropNone);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('disabledPropNone')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testButtonFocusablePropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonFocusablePropTrue', Level.LEVEL0, async function(done) {
            console.info('testButtonFocusablePropTrue START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropTrue);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('focusablePropTrue')
            expect(obj.$attrs.focusable).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testButtonFocusablePropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonFocusablePropFalse', Level.LEVEL0, async function(done) {
            console.info('testButtonFocusablePropFalse START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropFalse);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('focusablePropFalse')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testButtonFocusablePropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonFocusablePropNone', Level.LEVEL0, async function(done) {
            console.info('testButtonFocusablePropNone START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropNone);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('focusablePropNone')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testButtonDataProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonDataProp', Level.LEVEL0, async function(done) {
            console.info('testButtonDataProp START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataProp);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('dataProp')
            expect(obj.$attrs.dataButton).assertEqual(undefined);
            console.info("[buttonProps] get dataButton value is: " + JSON.stringify(obj.$attrs.dataButton));
            done();
        });

        /**
         * @tc.name   testButtonDataPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonDataPropNone', Level.LEVEL0, async function(done) {
            console.info('testButtonDataPropNone START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataPropNone);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('dataPropNone')
            expect(obj.$attrs.dataButton).assertEqual(undefined)
            console.info("[buttonProps] get dataButton value is: " + JSON.stringify(obj.$attrs.dataButton));
            done();
        });

        /**
         * @tc.name   testButtonClickEffectPropSmall
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonClickEffectPropSmall', Level.LEVEL0, async function(done) {
            console.info('testButtonClickEffectPropSmall START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropSmall);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('clickEffectPropSmall')
            expect(obj.$attrs.clickEffect).assertEqual('spring-small')
            done();
        });

        /**
         * @tc.name   testButtonClickEffectPropMedium
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonClickEffectPropMedium', Level.LEVEL0, async function(done) {
            console.info('testButtonClickEffectPropMedium START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropMedium);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('clickEffectPropMedium')
            expect(obj.$attrs.clickEffect).assertEqual('spring-medium')
            done();
        });

        /**
         * @tc.name   testButtonClickEffectPropLarge
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonClickEffectPropLarge', Level.LEVEL0, async function(done) {
            console.info('testButtonClickEffectPropLarge START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropLarge);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('clickEffectPropLarge')
            expect(obj.$attrs.clickEffect).assertEqual('spring-large')
            done();
        });

        /**
         * @tc.name   testButtonClickEffectPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonClickEffectPropNone', Level.LEVEL0, async function(done) {
            console.info('testButtonClickEffectPropNone START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropNone);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('clickEffectPropNone')
            expect(obj.$attrs.clickEffect).assertEqual(undefined)
            console.info("[buttonProps] get clickEffect value is: " + JSON.stringify(obj.$attrs.clickEffect));
            done();
        });

        /**
         * @tc.name   testButtonDirPropRtl
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonDirPropRtl', Level.LEVEL0, async function(done) {
            console.info('testButtonDirPropRtl START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropRtl);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('dirPropRtl')
            expect(obj.$attrs.dir).assertEqual('rtl')
            done();
        });

        /**
         * @tc.name   testButtonDirPropLtr
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonDirPropLtr', Level.LEVEL0, async function(done) {
            console.info('testButtonDirPropLtr START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropLtr);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('dirPropLtr')
            expect(obj.$attrs.dir).assertEqual('ltr')
            done();
        });

        /**
         * @tc.name   testButtonDirPropAuto
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonDirPropAuto', Level.LEVEL0, async function(done) {
            console.info('testButtonDirPropAuto START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropAuto);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('dirPropAuto')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testButtonDirPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonDirPropNone', Level.LEVEL0, async function(done) {
            console.info('testButtonDirPropNone START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropNone);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('dirPropNone')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testButtonForPropNull
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonForPropNull', Level.LEVEL0, async function(done) {
            console.info('testButtonForPropNull START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropNull);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('forPropNull')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[buttonProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testButtonForPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonForPropOne', Level.LEVEL0, async function(done) {
            console.info('testButtonForPropOne START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropOne);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('forPropOne')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[buttonProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testButtonForPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonForPropThree', Level.LEVEL0, async function(done) {
            console.info('testButtonForPropThree START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropThree);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('forPropThree')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[buttonProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testButtonIfPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonIfPropTrue', Level.LEVEL0, async function(done) {
            console.info('testButtonIfPropTrue START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.ifPropTrue);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('ifPropTrue')
            expect(obj.$attrs.if).assertEqual(undefined)
            console.info("[buttonProps] get for value is: " + JSON.stringify(obj.$attrs.if));
            done();
        });

        /**
         * @tc.name   testButtonShowPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonShowPropTrue', Level.LEVEL0, async function(done) {
            console.info('testButtonShowPropTrue START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropTrue);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('showPropTrue')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[buttonProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testButtonShowPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonShowPropFalse', Level.LEVEL0, async function(done) {
            console.info('testButtonShowPropFalse START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropFalse);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('showPropFalse')
            expect(obj.$attrs.show).assertEqual('false')
            console.info("[buttonProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testButtonShowPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonShowPropNone', Level.LEVEL0, async function(done) {
            console.info('testButtonShowPropNone START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropNone);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('showPropNone')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[buttonProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        // 特有属性

        /**
         * @tc.name   testButtonTypeArc
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonTypeArc', Level.LEVEL0, async function(done) {
            console.info('testButtonTypeArc START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeArc);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('typeArc')
            expect(obj.$attrs.type).assertEqual('arc')
            console.info("[buttonProps] get type value is: " + JSON.stringify(obj.$attrs.type));
            done();
        });

        /**
         * @tc.name   testButtonTypeCapsule
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonTypeCapsule', Level.LEVEL0, async function(done) {
            console.info('testButtonTypeCapsule START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeCapsule);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('typeCapsule')
            expect(obj.$attrs.type).assertEqual('capsule')
            console.info("[buttonProps] get type value is: " + JSON.stringify(obj.$attrs.type));
            done();
        });

        /**
         * @tc.name   testButtonTypeCircle
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonTypeCircle', Level.LEVEL0, async function(done) {
            console.info('testButtonTypeCircle START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeCircle);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('typeCircle')
            expect(obj.$attrs.type).assertEqual('circle')
            console.info("[buttonProps] get type value is: " + JSON.stringify(obj.$attrs.type));
            done();
        });

        /**
         * @tc.name   testButtonTypeText
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonTypeText', Level.LEVEL0, async function(done) {
            console.info('testButtonTypeText START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeText);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('typeText')
            expect(obj.$attrs.type).assertEqual('text')
            console.info("[buttonProps] get type value is: " + JSON.stringify(obj.$attrs.type));
            done();
        });

        /**
         * @tc.name   testButtonTypeDownload
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonTypeDownload', Level.LEVEL0, async function(done) {
            console.info('testButtonTypeDownload START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeDownload);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('typeDownload')
            expect(obj.$attrs.type).assertEqual('download')
            console.info("[buttonProps] get type value is: " + JSON.stringify(obj.$attrs.type));
            done();
        });

        /**
         * @tc.name   testButtonTypeNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonTypeNone', Level.LEVEL0, async function(done) {
            console.info('testButtonTypeNone START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeNone);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('typeNone')
            expect(obj.$attrs.type).assertEqual('capsule')
            console.info("[buttonProps] get type value is: " + JSON.stringify(obj.$attrs.type));
            done();
        });

        /**
         * @tc.name   testButtonValue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonValue', Level.LEVEL0, async function(done) {
            console.info('testButtonValue START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.value);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('value')
            expect(obj.$attrs.value).assertEqual('按钮')
            console.info("[buttonProps] get value value is: " + JSON.stringify(obj.$attrs.value));
            done();
        });

        /**
         * @tc.name   testButtonValueNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonValueNone', Level.LEVEL0, async function(done) {
            console.info('testButtonValueNone START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.valueNone);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('valueNone')
            expect(obj.$attrs.value).assertEqual(undefined)
            console.info("[buttonProps] get value value is: " + JSON.stringify(obj.$attrs.value));
            done();
        });

        /**
         * @tc.name   testButtonIcon
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonIcon', Level.LEVEL0, async function(done) {
            console.info('testButtonIcon START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.icon);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('icon')
            expect(obj.$attrs.icon).assertEqual('common/images/image.png')
            console.info("[buttonProps] get icon value is: " + JSON.stringify(obj.$attrs.icon));
            done();
        });

        /**
         * @tc.name   testButtonIconNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonIconNone', Level.LEVEL0, async function(done) {
            console.info('testButtonIconNone START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.iconNone);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('iconNone')
            expect(obj.$attrs.icon).assertEqual(undefined)
            console.info("[buttonProps] get icon value is: " + JSON.stringify(obj.$attrs.icon));
            done();
        });

        /**
         * @tc.name   testButtonPlacementStart
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonPlacementStart', Level.LEVEL0, async function(done) {
            console.info('testButtonPlacementStart START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.placementStart);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('placementStart')
            expect(obj.$attrs.placement).assertEqual('start')
            console.info("[buttonProps] get placement value is: " + JSON.stringify(obj.$attrs.placement));
            done();
        });

        /**
         * @tc.name   testButtonPlacementEnd
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonPlacementEnd', Level.LEVEL0, async function(done) {
            console.info('testButtonPlacementEnd START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.placementEnd);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('placementEnd')
            expect(obj.$attrs.placement).assertEqual('end')
            console.info("[buttonProps] get placement value is: " + JSON.stringify(obj.$attrs.placement));
            done();
        });

        /**
         * @tc.name   testButtonPlacementTop
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonPlacementTop', Level.LEVEL0, async function(done) {
            console.info('testButtonPlacementTop START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.placementTop);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('placementTop')
            expect(obj.$attrs.placement).assertEqual('top')
            console.info("[buttonProps] get placement value is: " + JSON.stringify(obj.$attrs.placement));
            done();
        });

        /**
         * @tc.name   testButtonPlacementBottom
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonPlacementBottom', Level.LEVEL0, async function(done) {
            console.info('testButtonPlacementBottom START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.placementBottom);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('placementBottom')
            expect(obj.$attrs.placement).assertEqual('bottom')
            console.info("[buttonProps] get placement value is: " + JSON.stringify(obj.$attrs.placement));
            done();
        });

        /**
         * @tc.name   testButtonPlacementNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonPlacementNone', Level.LEVEL0, async function(done) {
            console.info('testButtonPlacementNone START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.placementNone);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('placementNone')
            expect(obj.$attrs.placement).assertEqual('end')
            console.info("[buttonProps] get placement value is: " + JSON.stringify(obj.$attrs.placement));
            done();
        });

        /**
         * @tc.name   testButtonWaitingTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonWaitingTrue', Level.LEVEL0, async function(done) {
            console.info('testButtonWaitingTrue START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.waitingTrue);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('waitingTrue')
            expect(obj.$attrs.waiting).assertEqual('true')
            console.info("[buttonProps] get waiting value is: " + JSON.stringify(obj.$attrs.waiting));
            done();
        });

        /**
         * @tc.name   testButtonWaitingFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonWaitingFalse', Level.LEVEL0, async function(done) {
            console.info('testButtonWaitingFalse START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.waitingFalse);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('waitingFalse')
            expect(obj.$attrs.waiting).assertEqual('false')
            console.info("[buttonProps] get waiting value is: " + JSON.stringify(obj.$attrs.waiting));
            done();
        });

        /**
         * @tc.name   testButtonWaitingNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonWaitingNone', Level.LEVEL0, async function(done) {
            console.info('testButtonWaitingNone START');
            console.info("[buttonProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.waitingNone);
            console.info("[buttonProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[buttonProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('button')
            expect(obj.$attrs.id).assertEqual('waitingNone')
            expect(obj.$attrs.waiting).assertEqual('false')
            console.info("[buttonProps] get waiting value is: " + JSON.stringify(obj.$attrs.waiting));
            done();
        });
    });
}