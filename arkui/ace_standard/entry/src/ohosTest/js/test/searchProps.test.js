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


export default function searchPropsJsTest() {
    describe('searchPropsJsTest', function() {

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
            console.info('[searchPropsJsTest] before each called')

            let result;
            let options = {
                uri: 'pages/search/prop/index'
            }
            try {
                result = router.push(options)
                console.info("push searchProps page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push searchProps page error " + JSON.stringify(result));
            }
            await sleep(4000)
            done()
        });

        /**
         * run after testcase
         */
        afterAll(async function() {
            console.info('[searchPropsJsTest] after each called')
            await backToIndex()
            await sleep(1000)
        });

        /**
         * @tc.name   testsearchIdProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchIdProp', Level.LEVEL0, async function(done) {
            console.info('testsearchIdProp START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.idProp);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('idProp')
            done();
        });

        /**
         * @tc.name   testsearchClassProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchClassProp', Level.LEVEL0, async function(done) {
            console.info('testsearchClassProp START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classProp);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('classProp')
            done();
        });

        /**
         * @tc.name   testsearchClassPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchClassPropNone', Level.LEVEL0, async function(done) {
            console.info('testsearchClassPropNone START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classPropNone);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('classPropNone')
            expect(obj.$attrs.className).assertEqual(undefined)
            console.info("[searchProps] get className value is: " + JSON.stringify(obj.$attrs.className));
            done();
        });

        /**
         * @tc.name   testsearchRefProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchRefProp', Level.LEVEL0, async function(done) {
            console.info('testsearchRefProp START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refProp);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('refProp')
            expect(obj.$attrs.ref).assertEqual('refProp')
            done();
        });

        /**
         * @tc.name   testsearchRefPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchRefPropNone', Level.LEVEL0, async function(done) {
            console.info('testsearchRefPropNone START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refPropNone);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('refPropNone')
            expect(obj.$attrs.ref).assertEqual(undefined)
            console.info("[searchProps] get ref value is: " + JSON.stringify(obj.$attrs.ref));
            done();
        });

        /**
         * @tc.name   testsearchDisabledPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchDisabledPropTrue', Level.LEVEL0, async function(done) {
            console.info('testsearchDisabledPropTrue START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropTrue);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('disabledPropTrue')
            expect(obj.$attrs.disabled).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testsearchDisabledPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchDisabledPropFalse', Level.LEVEL0, async function(done) {
            console.info('testsearchDisabledPropFalse START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropFalse);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('disabledPropFalse')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testsearchDisabledPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchDisabledPropNone', Level.LEVEL0, async function(done) {
            console.info('testsearchDisabledPropNone START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropNone);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('disabledPropNone')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testsearchFocusablePropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchFocusablePropTrue', Level.LEVEL0, async function(done) {
            console.info('testsearchFocusablePropTrue START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropTrue);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('focusablePropTrue')
            expect(obj.$attrs.focusable).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testsearchFocusablePropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchFocusablePropFalse', Level.LEVEL0, async function(done) {
            console.info('testsearchFocusablePropFalse START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropFalse);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('focusablePropFalse')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testsearchFocusablePropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchFocusablePropNone', Level.LEVEL0, async function(done) {
            console.info('testsearchFocusablePropNone START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropNone);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('focusablePropNone')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testsearchDataProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchDataProp', Level.LEVEL0, async function(done) {
            console.info('testsearchDataProp START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataProp);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('dataProp')
            expect(obj.$attrs.datasearch).assertEqual(undefined);
            console.info("[searchProps] get datasearch value is: " + JSON.stringify(obj.$attrs.datasearch));
            done();
        });

        /**
         * @tc.name   testsearchDataPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchDataPropNone', Level.LEVEL0, async function(done) {
            console.info('testsearchDataPropNone START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataPropNone);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('dataPropNone')
            expect(obj.$attrs.datasearch).assertEqual(undefined)
            console.info("[searchProps] get datasearch value is: " + JSON.stringify(obj.$attrs.datasearch));
            done();
        });

        /**
         * @tc.name   testsearchClickEffectPropSmall
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchClickEffectPropSmall', Level.LEVEL0, async function(done) {
            console.info('testsearchClickEffectPropSmall START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropSmall);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('clickEffectPropSmall')
            expect(obj.$attrs.clickEffect).assertEqual('spring-small')
            done();
        });

        /**
         * @tc.name   testsearchClickEffectPropMedium
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchClickEffectPropMedium', Level.LEVEL0, async function(done) {
            console.info('testsearchClickEffectPropMedium START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropMedium);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('clickEffectPropMedium')
            expect(obj.$attrs.clickEffect).assertEqual('spring-medium')
            done();
        });

        /**
         * @tc.name   testsearchClickEffectPropLarge
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchClickEffectPropLarge', Level.LEVEL0, async function(done) {
            console.info('testsearchClickEffectPropLarge START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropLarge);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('clickEffectPropLarge')
            expect(obj.$attrs.clickEffect).assertEqual('spring-large')
            done();
        });

        /**
         * @tc.name   testsearchClickEffectPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchClickEffectPropNone', Level.LEVEL0, async function(done) {
            console.info('testsearchClickEffectPropNone START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropNone);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('clickEffectPropNone')
            expect(obj.$attrs.clickEffect).assertEqual(undefined)
            console.info("[searchProps] get clickEffect value is: " + JSON.stringify(obj.$attrs.clickEffect));
            done();
        });

        /**
         * @tc.name   testsearchDirPropRtl
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchDirPropRtl', Level.LEVEL0, async function(done) {
            console.info('testsearchDirPropRtl START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropRtl);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('dirPropRtl')
            expect(obj.$attrs.dir).assertEqual('rtl')
            done();
        });

        /**
         * @tc.name   testsearchDirPropLtr
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchDirPropLtr', Level.LEVEL0, async function(done) {
            console.info('testsearchDirPropLtr START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropLtr);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('dirPropLtr')
            expect(obj.$attrs.dir).assertEqual('ltr')
            done();
        });

        /**
         * @tc.name   testsearchDirPropAuto
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchDirPropAuto', Level.LEVEL0, async function(done) {
            console.info('testsearchDirPropAuto START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropAuto);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('dirPropAuto')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testsearchDirPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchDirPropNone', Level.LEVEL0, async function(done) {
            console.info('testsearchDirPropNone START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropNone);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('dirPropNone')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testsearchForPropNull
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchForPropNull', Level.LEVEL0, async function(done) {
            console.info('testsearchForPropNull START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropNull);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('forPropNull')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[searchProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testsearchForPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchForPropOne', Level.LEVEL0, async function(done) {
            console.info('testsearchForPropOne START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropOne);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('forPropOne')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[searchProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testsearchForPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchForPropThree', Level.LEVEL0, async function(done) {
            console.info('testsearchForPropThree START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropThree);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('forPropThree')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[searchProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testsearchIfPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchIfPropTrue', Level.LEVEL0, async function(done) {
            console.info('testsearchIfPropTrue START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.ifPropTrue);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('ifPropTrue')
            expect(obj.$attrs.if).assertEqual(undefined)
            console.info("[searchProps] get for value is: " + JSON.stringify(obj.$attrs.if));
            done();
        });

        /**
         * @tc.name   testsearchShowPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchShowPropTrue', Level.LEVEL0, async function(done) {
            console.info('testsearchShowPropTrue START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropTrue);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('showPropTrue')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[searchProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testsearchShowPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchShowPropFalse', Level.LEVEL0, async function(done) {
            console.info('testsearchShowPropFalse START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropFalse);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('showPropFalse')
            expect(obj.$attrs.show).assertEqual('false')
            console.info("[searchProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testsearchShowPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchShowPropNone', Level.LEVEL0, async function(done) {
            console.info('testsearchShowPropNone START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropNone);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('showPropNone')
            expect(obj.$attrs.show).assertEqual("true")
            console.info("[searchProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testsearchValuePropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchValuePropNone', Level.LEVEL0, async function(done) {
            console.info('testsearchXsPropNone START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.valueNone);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('valueNone')
            expect(obj.$attrs.value).assertEqual(undefined)
            console.info("[searchProps] get value value is: " + JSON.stringify(obj.$attrs.value));
            done();
        });

        /**
         * @tc.name   testsearchValueProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchValueProp', Level.LEVEL0, async function(done) {
            console.info('testsearchXsPropNone START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.value);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('value')
            expect(obj.$attrs.value).assertEqual('text')
            console.info("[searchProps] get value value is: " + JSON.stringify(obj.$attrs.value));
            done();
        });

        /**
         * @tc.name   testsearchIconPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchIconPropNone', Level.LEVEL0, async function(done) {
            console.info('testsearchXsPropNone START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.iconNone);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('iconNone')
            expect(obj.$attrs.icon).assertEqual(undefined)
            console.info("[searchProps] get checked value is: " + JSON.stringify(obj.$attrs.icon));
            done();
        });

        /**
         * @tc.name   testsearchIconProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchIconProp', Level.LEVEL0, async function(done) {
            console.info('testsearchXsPropNone START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.icon);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('icon')
            expect(obj.$attrs.icon).assertEqual("common/images/image.png")
            console.info("[searchProps] get checked value is: " + JSON.stringify(obj.$attrs.icon));
            done();
        });

        /**
         * @tc.name   testsearchHintPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchHintPropNone', Level.LEVEL0, async function(done) {
            console.info('testsearchXsPropNone START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.hintNone);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('hintNone')
            expect(obj.$attrs.hint).assertEqual(undefined)
            console.info("[searchProps] get hint value is: " + JSON.stringify(obj.$attrs.hint));
            done();
        });

        /**
         * @tc.name   testsearchHintProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchHintProp', Level.LEVEL0, async function(done) {
            console.info('testsearchXsPropNone START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.hint);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('hint')
            expect(obj.$attrs.hint).assertEqual("提示")
            console.info("[searchProps] get hint value is: " + JSON.stringify(obj.$attrs.hint));
            done();
        });

        /**
         * @tc.name   testsearchMenuoptionsPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchMenuoptionsPropNone', Level.LEVEL0, async function(done) {
            console.info('testsearchXsPropNone START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.menuoptionsNone);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('menuoptionsNone')
            expect(obj.$attrs.menuoptions).assertEqual(undefined)
            console.info("[searchProps] get menuoptions value is: " + JSON.stringify(obj.$attrs.menuoptions));
            done();
        });

        /**
         * @tc.name   testsearchMenuoptionsProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchMenuoptionsProp', Level.LEVEL0, async function(done) {
            console.info('testsearchXsPropNone START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.menuoptions);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('menuoptions')
            expect(obj.$attrs.menuoptions).assertEqual(undefined)
            console.info("[searchProps] get menuoptions value is: " + JSON.stringify(obj.$attrs.menuoptions));
            done();
        });

        /**
         * @tc.name   testsearchSearchbuttonPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchSearchbuttonPropNone', Level.LEVEL0, async function(done) {
            console.info('testsearchXsPropNone START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.searchbuttonNone);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('searchbuttonNone')
            expect(obj.$attrs.searchbutton).assertEqual(undefined)
            console.info("[searchProps] get searchbutton value is: " + JSON.stringify(obj.$attrs.searchbutton));
            done();
        });

        /**
         * @tc.name   testsearchSearchbuttonProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testsearchSearchbuttonProp', Level.LEVEL0, async function(done) {
            console.info('testsearchXsPropNone START');
            console.info("[searchProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.searchbutton);
            console.info("[searchProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[searchProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('search')
            expect(obj.$attrs.id).assertEqual('searchbutton')
            expect(obj.$attrs.searchbutton).assertEqual("按钮")
            console.info("[searchProps] get searchbutton value is: " + JSON.stringify(obj.$attrs.searchbutton));
            done();
        });
    });
}