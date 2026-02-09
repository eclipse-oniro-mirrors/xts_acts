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
    describe('refreshPropsJsTest', function() {

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
            console.info('[refreshPropsJsTest] before each called')

            let result;
            let options = {
                uri: 'pages/refresh/prop/index'
            }
            try {
                result = router.push(options)
                console.info("push refreshProps page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push refreshProps page error " + JSON.stringify(result));
            }
            await sleep(4000)
            done()
        });

        /**
         * run after testcase
         */
        afterAll(async function() {
            console.info('[refreshPropsJsTest] after each called')
            await backToIndex()
            await sleep(1000)
        });

        /**
         * @tc.name   testRefreshIdProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshIdProp', Level.LEVEL0, async function(done) {
            console.info('testRefreshIdProp START');
            console.info("[RefreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.idProp);
            console.info("[RefreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[RefreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('idProp')
            done();
        });

        /**
         * @tc.name   testRefreshClassProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshClassProp', Level.LEVEL0, async function(done) {
            console.info('testRefreshClassProp START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classProp);
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('classProp')
            done();
        });

        /**
         * @tc.name   testRefreshClassPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshClassPropNone', Level.LEVEL0, async function(done) {
            console.info('testRefreshClassPropNone START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classPropNone);
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('classPropNone')
            expect(obj.$attrs.className).assertEqual(undefined)
            console.info("[refreshProps] get className value is: " + JSON.stringify(obj.$attrs.className));
            done();
        });

        /**
         * @tc.name   testRefreshRefProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshRefProp', Level.LEVEL0, async function(done) {
            console.info('testRefreshRefProp START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refProp);
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('refProp')
            expect(obj.$attrs.ref).assertEqual('refProp')
            done();
        });

        /**
         * @tc.name   testRefreshRefPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshRefPropNone', Level.LEVEL0, async function(done) {
            console.info('testRefreshRefPropNone START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refPropNone);
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('refPropNone')
            expect(obj.$attrs.ref).assertEqual(undefined)
            console.info("[refreshProps] get ref value is: " + JSON.stringify(obj.$attrs.ref));
            done();
        });

        /**
         * @tc.name   testRefreshDisabledPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshDisabledPropTrue', Level.LEVEL0, async function(done) {
            console.info('testRefreshDisabledPropTrue START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropTrue);
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('disabledPropTrue')
            expect(obj.$attrs.disabled).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testRefreshDisabledPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshDisabledPropFalse', Level.LEVEL0, async function(done) {
            console.info('testRefreshDisabledPropFalse START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropFalse);
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('disabledPropFalse')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testRefreshDisabledPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshDisabledPropNone', Level.LEVEL0, async function(done) {
            console.info('testRefreshDisabledPropNone START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropNone);
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('disabledPropNone')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testRefreshFocusablePropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshFocusablePropTrue', Level.LEVEL0, async function(done) {
            console.info('testRefreshFocusablePropTrue START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropTrue);
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('focusablePropTrue')
            expect(obj.$attrs.focusable).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testRefreshFocusablePropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshFocusablePropFalse', Level.LEVEL0, async function(done) {
            console.info('testRefreshFocusablePropFalse START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropFalse);
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('focusablePropFalse')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testRefreshFocusablePropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshFocusablePropNone', Level.LEVEL0, async function(done) {
            console.info('testRefreshFocusablePropNone START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropNone);
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('focusablePropNone')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testRefreshDataProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshDataProp', Level.LEVEL0, async function(done) {
            console.info('testRefreshDataProp START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataProp);
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('dataProp')
            expect(obj.$attrs.dataRefresh).assertEqual(undefined);
            console.info("[refreshProps] get dataRefresh value is: " + JSON.stringify(obj.$attrs.dataRefresh));
            done();
        });

        /**
         * @tc.name   testRefreshDataPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshDataPropNone', Level.LEVEL0, async function(done) {
            console.info('testRefreshDataPropNone START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataPropNone);
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('dataPropNone')
            expect(obj.$attrs.dataRefresh).assertEqual(undefined)
            console.info("[refreshProps] get dataRefresh value is: " + JSON.stringify(obj.$attrs.dataRefresh));
            done();
        });

        /**
         * @tc.name   testRefreshClickEffectPropSmall
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshClickEffectPropSmall', Level.LEVEL0, async function(done) {
            console.info('testRefreshClickEffectPropSmall START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropSmall);
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('clickEffectPropSmall')
            expect(obj.$attrs.clickEffect).assertEqual('spring-small')
            done();
        });

        /**
         * @tc.name   testRefreshClickEffectPropMedium
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshClickEffectPropMedium', Level.LEVEL0, async function(done) {
            console.info('testRefreshClickEffectPropMedium START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropMedium);
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('clickEffectPropMedium')
            expect(obj.$attrs.clickEffect).assertEqual('spring-medium')
            done();
        });

        /**
         * @tc.name   testRefreshClickEffectPropLarge
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshClickEffectPropLarge', Level.LEVEL0, async function(done) {
            console.info('testRefreshClickEffectPropLarge START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropLarge);
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('clickEffectPropLarge')
            expect(obj.$attrs.clickEffect).assertEqual('spring-large')
            done();
        });

        /**
         * @tc.name   testRefreshClickEffectPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshClickEffectPropNone', Level.LEVEL0, async function(done) {
            console.info('testRefreshClickEffectPropNone START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropNone);
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('clickEffectPropNone')
            expect(obj.$attrs.clickEffect).assertEqual(undefined)
            console.info("[refreshProps] get clickEffect value is: " + JSON.stringify(obj.$attrs.clickEffect));
            done();
        });

        /**
         * @tc.name   testRefreshDirPropRtl
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshDirPropRtl', Level.LEVEL0, async function(done) {
            console.info('testRefreshDirPropRtl START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropRtl);
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('dirPropRtl')
            expect(obj.$attrs.dir).assertEqual('rtl')
            done();
        });

        /**
         * @tc.name   testRefreshDirPropLtr
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshDirPropLtr', Level.LEVEL0, async function(done) {
            console.info('testRefreshDirPropLtr START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropLtr);
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('dirPropLtr')
            expect(obj.$attrs.dir).assertEqual('ltr')
            done();
        });

        /**
         * @tc.name   testRefreshDirPropAuto
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshDirPropAuto', Level.LEVEL0, async function(done) {
            console.info('testRefreshDirPropAuto START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropAuto);
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('dirPropAuto')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testRefreshDirPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshDirPropNone', Level.LEVEL0, async function(done) {
            console.info('testRefreshDirPropNone START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropNone);
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('dirPropNone')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testRefreshForPropNull
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshForPropNull', Level.LEVEL0, async function(done) {
            console.info('testRefreshForPropNull START');
            console.info("[RefreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropNull);
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('forPropNull')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[refreshProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testRefreshForPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshForPropOne', Level.LEVEL0, async function(done) {
            console.info('testRefreshForPropOne START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropOne);
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('forPropOne')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[refreshProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testRefreshForPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshForPropThree', Level.LEVEL0, async function(done) {
            console.info('testRefreshForPropThree START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropThree);
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('forPropThree')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[refreshProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testRefreshIfPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshIfPropTrue', Level.LEVEL0, async function(done) {
            console.info('testRefreshIfPropTrue START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.ifPropTrue);
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('ifPropTrue')
            expect(obj.$attrs.if).assertEqual(undefined)
            console.info("[refreshProps] get for value is: " + JSON.stringify(obj.$attrs.if));
            done();
        });

        /**
         * @tc.name   testRefreshShowPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshShowPropTrue', Level.LEVEL0, async function(done) {
            console.info('testRefreshShowPropTrue START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropTrue);
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('showPropTrue')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[refreshProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testRefreshShowPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshShowPropFalse', Level.LEVEL0, async function(done) {
            console.info('testRefreshShowPropFalse START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropFalse);
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('showPropFalse')
            expect(obj.$attrs.show).assertEqual('false')
            console.info("[refreshProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testRefreshShowPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshShowPropNone', Level.LEVEL0, async function(done) {
            console.info('testRefreshShowPropNone START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropNone);
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('showPropNone')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[refreshProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });


        /**
         * @tc.name   testOffsetProp
         * @tc.number testOffsetProp
         * @tc.desc   testOffsetProp
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOffsetProp', Level.LEVEL0, async function(done) {
            console.info('testOffsetProp START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.offsetProp);
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('offsetProp')
            expect(obj.$attrs.offset).assertEqual('10px')
            console.info("[refreshProps] get for value is: " + JSON.stringify(obj.$attrs.offset));
            done();
        });


        /**
         * @tc.name   testRefreshingPropFalse
         * @tc.number testRefreshingPropFalse
         * @tc.desc   testRefreshingPropFalse
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshingPropFalse', Level.LEVEL0, async function(done) {
            console.info('testRefreshingPropFalse START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refreshingPropFalse);
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('refreshingPropFalse')
            expect(obj.$attrs.refreshing).assertEqual('false')
            console.info("[refreshProps] get for value is: " + JSON.stringify(obj.$attrs.refreshing));
            done();
        });


        /**
         * @tc.name   testRefreshingPropTrue
         * @tc.number testRefreshingPropTrue
         * @tc.desc   testRefreshingPropTrue
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshingPropTrue', Level.LEVEL0, async function(done) {
            console.info('testRefreshingPropTrue START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refreshingPropTrue); //id
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh') //type
            expect(obj.$attrs.id).assertEqual('refreshingPropTrue') //id
            expect(obj.$attrs.refreshing).assertEqual('false') //propValue
            console.info("[refreshProps] get for value is: " + JSON.stringify(obj.$attrs.refreshing));
            done();
        });


        /**
         * @tc.name   testTypePropAuto
         * @tc.number testTypePropAuto
         * @tc.desc   testTypePropAuto
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testTypePropAuto', Level.LEVEL0, async function(done) {
            console.info('testTypePropAuto START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typePropAuto);
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('typePropAuto')
            expect(obj.$attrs.type).assertEqual('auto')
            console.info("[refreshProps] get for value is: " + JSON.stringify(obj.$attrs.type));
            done();
        });


        /**
         * @tc.name   testTypePropPullDown
         * @tc.number testTypePropPullDown
         * @tc.desc   testTypePropPullDown
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testTypePropPullDown', Level.LEVEL0, async function(done) {
            console.info('testTypePropPullDown START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typePropPullDown);
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh')
            expect(obj.$attrs.id).assertEqual('typePropPullDown')
            expect(obj.$attrs.typePropAuto).assertEqual('auto')
            console.info("[refreshProps] get for value is: " + JSON.stringify(obj.$attrs.type));
            done();
        });


        /**
         * @tc.name   testLastTimePropTrue
         * @tc.number testLastTimePropTrue
         * @tc.desc   testLastTimePropTrue
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testLastTimePropTrue', Level.LEVEL0, async function(done) {
            console.info('testLastTimePropTrue START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.lastTimePropTrue); //id
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh') //type
            expect(obj.$attrs.id).assertEqual('lastTimePropTrue') //id
            expect(obj.$attrs.refreshing).assertEqual('true') //propValue
            console.info("[refreshProps] get for value is: " + JSON.stringify(obj.$attrs.lasttime)); //pro
            done();
        });


        /**
         * @tc.name   testLastTimePropFalse
         * @tc.number testLastTimePropFalse
         * @tc.desc   testLastTimePropFalse
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testLastTimePropFalse', Level.LEVEL0, async function(done) {
            console.info('testLastTimePropFalse START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.lastTimePropFalse); //id
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh') //type
            expect(obj.$attrs.id).assertEqual('lastTimePropFalse') //id
            expect(obj.$attrs.refreshing).assertEqual('false') //propValue
            console.info("[refreshProps] get for value is: " + JSON.stringify(obj.$attrs.lasttime)); //pro
            done();
        })


        /**
         * @tc.name   testFrictionProp
         * @tc.number testFrictionProp
         * @tc.desc   testFrictionProp
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testFrictionProp', Level.LEVEL0, async function(done) {
            console.info('testFrictionProp START');
            console.info("[refreshProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.frictionProp); //id
            console.info("[refreshProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[refreshProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('refresh') //type
            expect(obj.$attrs.id).assertEqual('frictionProp') //id
            expect(obj.$attrs.refreshing).assertEqual('42') //propValue
            console.info("[refreshProps] get for value is: " + JSON.stringify(obj.$attrs.friction)); //pro
            done();
        })

    });
}