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


export default function popupPropsJsTest() {
    describe('popupPropsJsTest', function() {

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
            console.info('[popupPropsJsTest] before each called')

            let result;
            let options = {
                uri: 'pages/popup/prop/index'
            }
            try {
                result = router.push(options)
                console.info("push popupProps page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push popupProps page error " + JSON.stringify(result));
            }
            await sleep(4000)
            done()
        });

        /**
         * run after testcase
         */
        afterAll(async function() {
            console.info('[popupPropsJsTest] after each called')
            await backToIndex()
            await sleep(1000)
        });

        /**
         * @tc.name   testPopupIdProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPopupIdProp', Level.LEVEL0, async function(done) {
            console.info('testPopupIdProp START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.idProp);
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('idProp')
            done();
        });

        /**
         * @tc.name   testPopupClassProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPopupClassProp', Level.LEVEL0, async function(done) {
            console.info('testPopupClassProp START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classProp);
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('classProp')
            expect(obj.$attrs.className).assertEqual('classProp')
            done();
        });

        /**
         * @tc.name   testPopupClassPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPopupClassPropNone', Level.LEVEL0, async function(done) {
            console.info('testPopupClassPropNone START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classPropNone);
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('classPropNone')
            expect(obj.$attrs.className).assertEqual(undefined)
            console.info("[popupProps] get className value is: " + JSON.stringify(obj.$attrs.className));
            done();
        });


        /**
         * @tc.name   testPopupRefProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPopupRefProp', Level.LEVEL0, async function(done) {
            console.info('testPopupRefProp START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refProp);
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('refProp')
            expect(obj.$attrs.ref).assertEqual('refProp')
            done();
        });

        /**
         * @tc.name   testPopupRefPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPopupRefPropNone', Level.LEVEL0, async function(done) {
            console.info('testPopupRefPropNone START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refPropNone);
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('refPropNone')
            expect(obj.$attrs.ref).assertEqual(undefined)
            console.info("[popupProps] get ref value is: " + JSON.stringify(obj.$attrs.ref));
            done();
        });

        /**
         * @tc.name   testPopupDisabledPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPopupDisabledPropTrue', Level.LEVEL0, async function(done) {
            console.info('testPopupDisabledPropTrue START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropTrue);
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('disabledPropTrue')
            expect(obj.$attrs.disabled).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testPopupDisabledPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPopupDisabledPropFalse', Level.LEVEL0, async function(done) {
            console.info('testPopupDisabledPropFalse START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropFalse);
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('disabledPropFalse')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testPopupDisabledPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPopupDisabledPropNone', Level.LEVEL0, async function(done) {
            console.info('testPopupDisabledPropNone START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropNone);
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('disabledPropNone')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testPopupDataProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPopupDataProp', Level.LEVEL0, async function(done) {
            console.info('testPopupDataProp START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataProp);
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('dataProp')
            expect(obj.$attrs.dataPopup).assertEqual(undefined);
            console.info("[popupProps] get dataPopup value is: " + JSON.stringify(obj.$attrs.dataPopup));
            done();
        });

        /**
         * @tc.name   testPopupDataPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPopupDataPropNone', Level.LEVEL0, async function(done) {
            console.info('testPopupDataPropNone START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataPropNone);
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('dataPropNone')
            expect(obj.$attrs.dataPopup).assertEqual(undefined)
            console.info("[popupProps] get dataPopup value is: " + JSON.stringify(obj.$attrs.dataPopup));
            done();
        });

        /**
         * @tc.name   testPopupClickEffectPropSmall
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPopupClickEffectPropSmall', Level.LEVEL0, async function(done) {
            console.info('testPopupClickEffectPropSmall START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropSmall);
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('clickEffectPropSmall')
            expect(obj.$attrs.clickEffect).assertEqual('spring-small')
            done();
        });

        /**
         * @tc.name   testPopupClickEffectPropMedium
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPopupClickEffectPropMedium', Level.LEVEL0, async function(done) {
            console.info('testPopupClickEffectPropMedium START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropMedium);
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('clickEffectPropMedium')
            expect(obj.$attrs.clickEffect).assertEqual('spring-medium')
            done();
        });

        /**
         * @tc.name   testPopupClickEffectPropLarge
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPopupClickEffectPropLarge', Level.LEVEL0, async function(done) {
            console.info('testPopupClickEffectPropLarge START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropLarge);
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('clickEffectPropLarge')
            expect(obj.$attrs.clickEffect).assertEqual('spring-large')
            done();
        });

        /**
         * @tc.name   testPopupClickEffectPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPopupClickEffectPropNone', Level.LEVEL0, async function(done) {
            console.info('testPopupClickEffectPropNone START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropNone);
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('clickEffectPropNone')
            expect(obj.$attrs.clickEffect).assertEqual(undefined)
            console.info("[popupProps] get clickEffect value is: " + JSON.stringify(obj.$attrs.clickEffect));
            done();
        });

        /**
         * @tc.name   testPopupDirPropRtl
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPopupDirPropRtl', Level.LEVEL0, async function(done) {
            console.info('testPopupDirPropRtl START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropRtl);
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('dirPropRtl')
            expect(obj.$attrs.dir).assertEqual('rtl')
            done();
        });

        /**
         * @tc.name   testPopupDirPropLtr
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPopupDirPropLtr', Level.LEVEL0, async function(done) {
            console.info('testPopupDirPropLtr START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropLtr);
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('dirPropLtr')
            expect(obj.$attrs.dir).assertEqual('ltr')
            done();
        });

        /**
         * @tc.name   testPopupDirPropAuto
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPopupDirPropAuto', Level.LEVEL0, async function(done) {
            console.info('testPopupDirPropAuto START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropAuto);
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('dirPropAuto')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testPopupDirPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPopupDirPropNone', Level.LEVEL0, async function(done) {
            console.info('testPopupDirPropNone START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropNone);
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('dirPropNone')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testPopupForPropNull
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPopupForPropNull', Level.LEVEL0, async function(done) {
            console.info('testPopupForPropNull START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropNull);
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('forPropNull')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[popupProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testPopupForPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPopupForPropOne', Level.LEVEL0, async function(done) {
            console.info('testPopupForPropOne START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropOne);
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('forPropOne')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[popupProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testPopupForPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPopupForPropThree', Level.LEVEL0, async function(done) {
            console.info('testPopupForPropThree START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropThree);
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('forPropThree')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[popupProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testPopupIfPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPopupIfPropTrue', Level.LEVEL0, async function(done) {
            console.info('testPopupIfPropTrue START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.ifPropTrue);
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('ifPropTrue')
            expect(obj.$attrs.if).assertEqual(undefined)
            console.info("[popupProps] get for value is: " + JSON.stringify(obj.$attrs.if));
            done();
        });


        /**
         * @tc.name   testPopupShowPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPopupShowPropTrue', Level.LEVEL0, async function(done) {
            console.info('testPopupShowPropTrue START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropTrue);
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('showPropTrue')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[popupProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testPopupShowPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPopupShowPropFalse', Level.LEVEL0, async function(done) {
            console.info('testPopupShowPropFalse START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropFalse);
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('showPropFalse')
            expect(obj.$attrs.show).assertEqual('false')
            console.info("[popupProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testPopupShowPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPopupShowPropNone', Level.LEVEL0, async function(done) {
            console.info('testPopupShowPropNone START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropNone);
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('showPropNone')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[popupProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testPopupTargetProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPopupTargetProp', Level.LEVEL0, async function(done) {
            console.info('testPopupTargetProp START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.targetProp); //ID
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('targetProp') //ID
            expect(obj.$attrs.target).assertEqual('target1') //PROP AND VALUE
            console.info("[popupProps] get target value is: " + JSON.stringify(obj.$attrs.target)); //PROP
            done();
        });

        /**
         * @tc.name   testPlacementPropLeft
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPlacementPropLeft', Level.LEVEL0, async function(done) {
            console.info('testPlacementPropLeft START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.placementPropLeft); //ID
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('placementPropLeft') //ID
            expect(obj.$attrs.placement).assertEqual('left') //PROP AND VALUE
            console.info("[popupProps] get placement value is: " + JSON.stringify(obj.$attrs.placement)); //PROP
            done();
        });

        /**
         * @tc.name   testPlacementPropRight
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPlacementPropRight', Level.LEVEL0, async function(done) {
            console.info('testPlacementPropRight START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.placementPropRight); //ID
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('placementPropRight') //ID
            expect(obj.$attrs.placement).assertEqual('right') //PROP AND VALUE
            console.info("[popupProps] get placement value is: " + JSON.stringify(obj.$attrs.placement)); //PROP
            done();
        });

        /**
         * @tc.name   testPlacementPropTop
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPlacementPropTop', Level.LEVEL0, async function(done) {
            console.info('testPlacementPropTop START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.placementPropTop); //ID
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('placementPropTop') //ID
            expect(obj.$attrs.placement).assertEqual('top') //PROP AND VALUE
            console.info("[popupProps] get placement value is: " + JSON.stringify(obj.$attrs.placement)); //PROP
            done();
        });

        /**
         * @tc.name   testKeepAlivePropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testKeepAlivePropTrue', Level.LEVEL0, async function(done) {
            console.info('testKeepAlivePropTrue START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.keepAlivePropTrue); //ID
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('keepAlivePropTrue') //ID
            expect(obj.$attrs.keepalive).assertEqual('true') //PROP AND VALUE
            console.info("[popupProps] get keepalive value is: " + JSON.stringify(obj.$attrs.keepalive)); //PROP
            done();
        });

        /**
         * @tc.name   testKeepAlivePropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testKeepAlivePropFalse', Level.LEVEL0, async function(done) {
            console.info('testKeepAlivePropFalse START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.keepAlivePropFalse); //ID
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('keepAlivePropFalse') //ID
            expect(obj.$attrs.keepalive).assertEqual('false') //PROP AND VALUE
            console.info("[popupProps] get keepalive value is: " + JSON.stringify(obj.$attrs.keepalive)); //PROP
            done();
        });

        /**
         * @tc.name   testClickablePropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testClickablePropTrue', Level.LEVEL0, async function(done) {
            console.info('testClickablePropTrue START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickablePropTrue); //ID
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('clickablePropTrue') //ID
            expect(obj.$attrs.clickable).assertEqual('true') //PROP AND VALUE
            console.info("[popupProps] get clickable value is: " + JSON.stringify(obj.$attrs.clickable)); //PROP
            done();
        });

        /**
         * @tc.name   testClickablePropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testClickablePropFalse', Level.LEVEL0, async function(done) {
            console.info('testClickablePropFalse START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickablePropFalse); //ID
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('clickablePropFalse') //ID
            expect(obj.$attrs.clickable).assertEqual('false') //PROP AND VALUE
            console.info("[popupProps] get clickable value is: " + JSON.stringify(obj.$attrs.clickable)); //PROP
            done();
        });


        /**
         * @tc.name   testArrowOffsetProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testArrowOffsetProp', Level.LEVEL0, async function(done) {
            console.info('testArrowOffsetProp START');
            console.info("[popupProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.arrowOffsetProp); //ID
            console.info("[popupProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[popupProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('popup')
            expect(obj.$attrs.id).assertEqual('arrowOffsetProp') //ID
            expect(obj.$attrs.arrowoffset).assertEqual('10px') //PROP AND VALUE
            console.info("[popupProps] get arrowoffset value is: " + JSON.stringify(obj.$attrs.arrowoffset)); //PROP
            done();
        });
    });
}