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


export default function chartPropsJsTest() {
    describe('chartPropsJsTest', function() {

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
            console.info('[chartPropsJsTest] before each called')

            let result;
            let options = {
                uri: 'pages/chart/prop/index'
            }
            try {
                result = router.push(options)
                console.info("push chartProps page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push chartProps page error " + JSON.stringify(result));
            }
            await sleep(4000)
            done()
        });

        /**
         * run after testcase
         */
        afterAll(async function() {
            console.info('[chartPropsJsTest] after each called')
            await backToIndex();
            await sleep(1000)
        });

        /**
         * @tc.name   testChartIdProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartIdProp', Level.LEVEL0, async function(done) {
            console.info('testChartIdProp START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.idProp);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('idProp')
            done();
        });

        /**
         * @tc.name   testChartClassProp
         * @tc.number testChartClassProp
         * @tc.desc   testChartClassProp
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartClassProp', Level.LEVEL0, async function(done) {
            console.info('testChartClassProp START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classProp);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('classProp')
            done();
        });

        /**
         * @tc.name   testChartClassPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartClassPropNone', Level.LEVEL0, async function(done) {
            console.info('testChartClassPropNone START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classPropNone);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('classPropNone')
            expect(obj.$attrs.className).assertEqual(undefined)
            console.info("[chartProps] get className value is: " + JSON.stringify(obj.$attrs.className));
            done();
        });

        /**
         * @tc.name   testChartRefProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartRefProp', Level.LEVEL0, async function(done) {
            console.info('testChartRefProp START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refProp);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('refProp')
            expect(obj.$attrs.ref).assertEqual('refProp')
            done();
        });

        /**
         * @tc.name   testChartRefPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartRefPropNone', Level.LEVEL0, async function(done) {
            console.info('testChartRefPropNone START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refPropNone);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('refPropNone')
            expect(obj.$attrs.ref).assertEqual(undefined)
            console.info("[chartProps] get ref value is: " + JSON.stringify(obj.$attrs.ref));
            done();
        });

        /**
         * @tc.name   testChartDisabledPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartDisabledPropTrue', Level.LEVEL0, async function(done) {
            console.info('testChartDisabledPropTrue START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropTrue);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('disabledPropTrue')
            expect(obj.$attrs.disabled).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testChartDisabledPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartDisabledPropFalse', Level.LEVEL0, async function(done) {
            console.info('testChartDisabledPropFalse START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropFalse);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('disabledPropFalse')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testChartDisabledPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartDisabledPropNone', Level.LEVEL0, async function(done) {
            console.info('testChartDisabledPropNone START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropNone);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('disabledPropNone')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testChartFocusablePropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartFocusablePropTrue', Level.LEVEL0, async function(done) {
            console.info('testChartFocusablePropTrue START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropTrue);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('focusablePropTrue')
            expect(obj.$attrs.focusable).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testChartFocusablePropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartFocusablePropFalse', Level.LEVEL0, async function(done) {
            console.info('testChartFocusablePropFalse START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropFalse);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('focusablePropFalse')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testChartFocusablePropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartFocusablePropNone', Level.LEVEL0, async function(done) {
            console.info('testChartFocusablePropNone START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropNone);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('focusablePropNone')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testChartDataProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartDataProp', Level.LEVEL0, async function(done) {
            console.info('testChartDataProp START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataProp);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('dataProp')
            expect(obj.$attrs.dataChart).assertEqual(undefined);
            console.info("[chartProps] get dataChart value is: " + JSON.stringify(obj.$attrs.dataChart));
            done();
        });

        /**
         * @tc.name   testChartDataPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartDataPropNone', Level.LEVEL0, async function(done) {
            console.info('testChartDataPropNone START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataPropNone);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('dataPropNone')
            expect(obj.$attrs.dataChart).assertEqual(undefined)
            console.info("[chartProps] get dataChart value is: " + JSON.stringify(obj.$attrs.dataChart));
            done();
        });

        /**
         * @tc.name   testChartClickEffectPropSmall
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartClickEffectPropSmall', Level.LEVEL0, async function(done) {
            console.info('testChartClickEffectPropSmall START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropSmall);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('clickEffectPropSmall')
            expect(obj.$attrs.clickEffect).assertEqual('spring-small')
            done();
        });

        /**
         * @tc.name   testChartClickEffectPropMedium
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartClickEffectPropMedium', Level.LEVEL0, async function(done) {
            console.info('testChartClickEffectPropMedium START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropMedium);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('clickEffectPropMedium')
            expect(obj.$attrs.clickEffect).assertEqual('spring-medium')
            done();
        });

        /**
         * @tc.name   testChartClickEffectPropLarge
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartClickEffectPropLarge', Level.LEVEL0, async function(done) {
            console.info('testChartClickEffectPropLarge START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropLarge);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('clickEffectPropLarge')
            expect(obj.$attrs.clickEffect).assertEqual('spring-large')
            done();
        });

        /**
         * @tc.name   testChartClickEffectPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartClickEffectPropNone', Level.LEVEL0, async function(done) {
            console.info('testChartClickEffectPropNone START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropNone);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('clickEffectPropNone')
            expect(obj.$attrs.clickEffect).assertEqual(undefined)
            console.info("[chartProps] get clickEffect value is: " + JSON.stringify(obj.$attrs.clickEffect));
            done();
        });

        /**
         * @tc.name   testChartDirPropRtl
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartDirPropRtl', Level.LEVEL0, async function(done) {
            console.info('testChartDirPropRtl START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropRtl);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('dirPropRtl')
            expect(obj.$attrs.dir).assertEqual('rtl')
            done();
        });

        /**
         * @tc.name   testChartDirPropLtr
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartDirPropLtr', Level.LEVEL0, async function(done) {
            console.info('testChartDirPropLtr START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropLtr);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('dirPropLtr')
            expect(obj.$attrs.dir).assertEqual('ltr')
            done();
        });

        /**
         * @tc.name   testChartDirPropAuto
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartDirPropAuto', Level.LEVEL0, async function(done) {
            console.info('testChartDirPropAuto START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropAuto);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('dirPropAuto')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testChartDirPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartDirPropNone', Level.LEVEL0, async function(done) {
            console.info('testChartDirPropNone START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropNone);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('dirPropNone')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testChartForPropNull
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartForPropNull', Level.LEVEL0, async function(done) {
            console.info('testChartForPropNull START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropNull);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('forPropNull')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[chartProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testChartForPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartForPropOne', Level.LEVEL0, async function(done) {
            console.info('testChartForPropOne START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropOne);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('forPropOne')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[chartProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testChartForPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartForPropThree', Level.LEVEL0, async function(done) {
            console.info('testChartForPropThree START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropThree);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('forPropThree')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[chartProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testChartIfPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartIfPropTrue', Level.LEVEL0, async function(done) {
            console.info('testChartIfPropTrue START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.ifPropTrue);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('ifPropTrue')
            expect(obj.$attrs.if).assertEqual(undefined)
            console.info("[chartProps] get for value is: " + JSON.stringify(obj.$attrs.if));
            done();
        });

        /**
         * @tc.name   testChartShowPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartShowPropTrue', Level.LEVEL0, async function(done) {
            console.info('testChartShowPropTrue START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropTrue);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('showPropTrue')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[chartProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testChartShowPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartShowPropFalse', Level.LEVEL0, async function(done) {
            console.info('testChartShowPropFalse START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropFalse);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('showPropFalse')
            expect(obj.$attrs.show).assertEqual('false')
            console.info("[chartProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testChartShowPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartShowPropNone', Level.LEVEL0, async function(done) {
            console.info('testChartShowPropNone START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropNone);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('showPropNone')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[chartProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        //  特有属性

        /**
         * @tc.name   testChartTypeBar
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartTypeBar', Level.LEVEL0, async function(done) {
            console.info('testChartTypeBar START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeBar);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('typeBar')
            expect(obj.$attrs.type).assertEqual('bar')
            console.info("[chartProps] get type value is: " + JSON.stringify(obj.$attrs.type));
            done();
        });

        /**
         * @tc.name   testChartTypeLine
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartTypeLine', Level.LEVEL0, async function(done) {
            console.info('testChartTypeLine START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeLine);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('typeLine')
            expect(obj.$attrs.type).assertEqual('line')
            console.info("[chartProps] get type value is: " + JSON.stringify(obj.$attrs.type));
            done();
        });

        /**
         * @tc.name   testChartTypeGauge
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartTypeGauge', Level.LEVEL0, async function(done) {
            console.info('testChartTypeGauge START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeGauge);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('typeGauge')
            expect(obj.$attrs.type).assertEqual('gauge')
            console.info("[chartProps] get type value is: " + JSON.stringify(obj.$attrs.type));
            done();
        });

        /**
         * @tc.name   testChartTypeProgress
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartTypeProgress', Level.LEVEL0, async function(done) {
            console.info('testChartTypeProgress START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeProgress);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('typeProgress')
            expect(obj.$attrs.type).assertEqual('progress')
            console.info("[chartProps] get type value is: " + JSON.stringify(obj.$attrs.type));
            done();
        });

        /**
         * @tc.name   testChartTypeLoading
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartTypeLoading', Level.LEVEL0, async function(done) {
            console.info('testChartTypeLoading START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeLoading);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('typeLoading')
            expect(obj.$attrs.type).assertEqual('loading')
            console.info("[chartProps] get type value is: " + JSON.stringify(obj.$attrs.type));
            done();
        });

        /**
         * @tc.name   testChartTypeRainbow
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartTypeRainbow', Level.LEVEL0, async function(done) {
            console.info('testChartTypeRainbow START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeRainbow);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('typeRainbow')
            expect(obj.$attrs.type).assertEqual('rainbow')
            console.info("[chartProps] get type value is: " + JSON.stringify(obj.$attrs.type));
            done();
        });

        /**
         * @tc.name   testChartTypeNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartTypeNone', Level.LEVEL0, async function(done) {
            console.info('testChartTypeNone START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeNone);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('typeNone')
            expect(obj.$attrs.type).assertEqual('line')
            console.info("[chartProps] get type value is: " + JSON.stringify(obj.$attrs.type));
            done();
        });

        /**
         * @tc.name   testChartOptions
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartOptions', Level.LEVEL0, async function(done) {
            console.info('testChartOptions START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.options);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('options')
            expect(obj.$attrs.options).assertEqual(undefined)
            console.info("[chartProps] get options value is: " + JSON.stringify(obj.$attrs.options));
            done();
        });

        /**
         * @tc.name   testChartOptionsNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartOptionsNone', Level.LEVEL0, async function(done) {
            console.info('testChartOptionsNone START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.optionsNone);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('optionsNone')
            expect(obj.$attrs.options).assertEqual(undefined)
            console.info("[chartProps] get options value is: " + JSON.stringify(obj.$attrs.options));
            done();
        });

        /**
         * @tc.name   testChartDatasets
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartDatasets', Level.LEVEL0, async function(done) {
            console.info('testChartDatasets START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.datasets);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('datasets')
            expect(obj.$attrs.datasets).assertEqual(undefined)
            console.info("[chartProps] get datasets value is: " + JSON.stringify(obj.$attrs.datasets));
            done();
        });

        /**
         * @tc.name   testChartDatasetsNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartDatasetsNone', Level.LEVEL0, async function(done) {
            console.info('testChartDatasetsNone START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.datasetsNone);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('datasetsNone')
            expect(obj.$attrs.datasets).assertEqual(undefined)
            console.info("[chartProps] get datasets value is: " + JSON.stringify(obj.$attrs.datasets));
            done();
        });

        /**
         * @tc.name   testChartSegmentsSeg
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartSegmentsSeg', Level.LEVEL0, async function(done) {
            console.info('testChartSegmentsSeg START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.segmentsSeg);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('segmentsSeg')
            expect(obj.$attrs.segments).assertEqual(undefined)
            console.info("[chartProps] get segments value is: " + JSON.stringify(obj.$attrs.segments));
            done();
        });

        /**
         * @tc.name   testChartSegmentsRain
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartSegmentsRain', Level.LEVEL0, async function(done) {
            console.info('testChartSegmentsRain START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.segmentsRain);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('segmentsRain')
            expect(obj.$attrs.segments).assertEqual(undefined)
            console.info("[chartProps] get segments value is: " + JSON.stringify(obj.$attrs.segments));
            done();
        });

        /**
         * @tc.name   testChartSegmentsNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartSegmentsNone', Level.LEVEL0, async function(done) {
            console.info('testChartSegmentsNone START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.segmentsNone);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('segmentsNone')
            expect(obj.$attrs.segments).assertEqual(undefined)
            console.info("[chartProps] get segments value is: " + JSON.stringify(obj.$attrs.segments));
            done();
        });

        /**
         * @tc.name   testChartEffectsTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartEffectsTrue', Level.LEVEL0, async function(done) {
            console.info('testChartEffectsTrue START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.effectsTrue);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('effectsTrue')
            expect(obj.$attrs.effects).assertEqual('true')
            console.info("[chartProps] get effects value is: " + JSON.stringify(obj.$attrs.effects));
            done();
        });

        /**
         * @tc.name   testChartEffectsFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartEffectsFalse', Level.LEVEL0, async function(done) {
            console.info('testChartEffectsFalse START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.effectsFalse);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('effectsFalse')
            expect(obj.$attrs.effects).assertEqual('false')
            console.info("[chartProps] get effects value is: " + JSON.stringify(obj.$attrs.effects));
            done();
        });

        /**
         * @tc.name   testChartEffectsNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartEffectsNone', Level.LEVEL0, async function(done) {
            console.info('testChartEffectsNone START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.effectsNone);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('effectsNone')
            expect(obj.$attrs.effects).assertEqual('true')
            console.info("[chartProps] get effects value is: " + JSON.stringify(obj.$attrs.effects));
            done();
        });

        /**
         * @tc.name   testChartAnimationduration
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartAnimationduration', Level.LEVEL0, async function(done) {
            console.info('testChartAnimationduration START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.animationduration);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('animationduration')
            expect(obj.$attrs.animationduration).assertEqual('3000')
            console.info("[chartProps] get animationduration value is: " + JSON.stringify(obj.$attrs.animationduration));
            done();
        });

        /**
         * @tc.name   testChartAnimationdurationNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testChartAnimationdurationNone', Level.LEVEL0, async function(done) {
            console.info('testChartAnimationdurationNone START');
            console.info("[chartProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.animationdurationNone);
            console.info("[chartProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[chartProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('chart')
            expect(obj.$attrs.id).assertEqual('animationdurationNone')
            expect(obj.$attrs.animationduration).assertEqual('3000')
            console.info("[chartProps] get animationduration value is: " + JSON.stringify(obj.$attrs.animationduration));
            done();
        });
    });
}