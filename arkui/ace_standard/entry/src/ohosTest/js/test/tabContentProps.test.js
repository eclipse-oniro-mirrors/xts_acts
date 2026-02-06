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
    describe('tab-ContentPropsJsTest', function() {

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
                    resolve()
                }, 500)
            })
            let clearPromise = new Promise((resolve, reject) => {
                setTimeout(() => {
                    router.clear();
                    resolve();
                }, 500);
            });
            await backToIndexPromise.then(() => {
                return clearPromise;
            })
        }

        /**
         * run before testcase
         */
        beforeAll(async function(done) {
            console.info('[tab-ContentPropsJsTest] before each called')

            let result;
            let options = {
                uri: 'pages/tab-Content/prop/index'
            }
            try {
                result = router.push(options)
                console.info("push tab-ContentProps page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push tab-ContentProps page error " + JSON.stringify(result));
            }
            await sleep(4000)
            done()
        })

        /**
         * run after testcase
         */
        afterAll(async function() {
            console.info('[tab-ContentPropsJsTest] after each called')
            await backToIndex();
            await sleep(1000)
        })

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTabContentIdProp
         * @tc.desc      ACE
         */
        it('testTabContentIdProp', Level.LEVEL0, async function(done) {
            console.info('testTabContentIdProp START');
            console.info("[tab-ContentProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.idProp);
            console.info("[tab-ContentProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[tab-ContentProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('tab-Content')
            expect(obj.$attrs.id).assertEqual('idProp')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTabContentClassProp
         * @tc.desc      ACE
         */
        it('testTabContentClassProp', Level.LEVEL0, async function(done) {
            console.info('testTabContentClassProp START');
            console.info("[tab-ContentProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classProp);
            console.info("[tab-ContentProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[tab-ContentProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('tab-Content')
            expect(obj.$attrs.id).assertEqual('classProp')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTabContentClassPropNone
         * @tc.desc      ACE
         */
        it('testTabContentClassPropNone', Level.LEVEL0, async function(done) {
            console.info('testTabContentClassPropNone START');
            console.info("[tab-ContentProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classPropNone);
            console.info("[tab-ContentProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[tab-ContentProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('tab-Content')
            expect(obj.$attrs.id).assertEqual('classPropNone')
            expect(obj.$attrs.className).assertEqual(undefined)
            console.info("[tab-ContentProps] get className value is: " + JSON.stringify(obj.$attrs.className));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTabContentRefProp
         * @tc.desc      ACE
         */
        it('testTabContentRefProp', Level.LEVEL0, async function(done) {
            console.info('testTabContentRefProp START');
            console.info("[tab-ContentProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refProp);
            console.info("[tab-ContentProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[tab-ContentProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('tab-Content')
            expect(obj.$attrs.id).assertEqual('refProp')
            expect(obj.$attrs.ref).assertEqual('refProp')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTabContentRefPropNone
         * @tc.desc      ACE
         */
        it('testTabContentRefPropNone', Level.LEVEL0, async function(done) {
            console.info('testTabContentRefPropNone START');
            console.info("[tab-ContentProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refPropNone);
            console.info("[tab-ContentProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[tab-ContentProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('tab-Content')
            expect(obj.$attrs.id).assertEqual('refPropNone')
            expect(obj.$attrs.ref).assertEqual(undefined)
            console.info("[tab-ContentProps] get ref value is: " + JSON.stringify(obj.$attrs.ref));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTabContentDisabledPropTrue
         * @tc.desc      ACE
         */
        it('testTabContentDisabledPropTrue', Level.LEVEL0, async function(done) {
            console.info('testTabContentDisabledPropTrue START');
            console.info("[tab-ContentProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropTrue);
            console.info("[tab-ContentProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[tab-ContentProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('tab-Content')
            expect(obj.$attrs.id).assertEqual('disabledPropTrue')
            expect(obj.$attrs.disabled).assertEqual('true')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTabContentDisabledPropFalse
         * @tc.desc      ACE
         */
        it('testTabContentDisabledPropFalse', Level.LEVEL0, async function(done) {
            console.info('testTabContentDisabledPropFalse START');
            console.info("[tab-ContentProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropFalse);
            console.info("[tab-ContentProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[tab-ContentProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('tab-Content')
            expect(obj.$attrs.id).assertEqual('disabledPropFalse')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTabContentDisabledPropNone
         * @tc.desc      ACE
         */
        it('testTabContentDisabledPropNone', Level.LEVEL0, async function(done) {
            console.info('testTabContentDisabledPropNone START');
            console.info("[tab-ContentProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropNone);
            console.info("[tab-ContentProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[tab-ContentProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('tab-Content')
            expect(obj.$attrs.id).assertEqual('disabledPropNone')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTabContentFocusablePropTrue
         * @tc.desc      ACE
         */
        it('testTabContentFocusablePropTrue', Level.LEVEL0, async function(done) {
            console.info('testTabContentFocusablePropTrue START');
            console.info("[tab-ContentProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropTrue);
            console.info("[tab-ContentProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[tab-ContentProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('tab-Content')
            expect(obj.$attrs.id).assertEqual('focusablePropTrue')
            expect(obj.$attrs.focusable).assertEqual('true')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTabContentFocusablePropFalse
         * @tc.desc      ACE
         */
        it('testTabContentFocusablePropFalse', Level.LEVEL0, async function(done) {
            console.info('testTabContentFocusablePropFalse START');
            console.info("[tab-ContentProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropFalse);
            console.info("[tab-ContentProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[tab-ContentProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('tab-Content')
            expect(obj.$attrs.id).assertEqual('focusablePropFalse')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTabContentFocusablePropNone
         * @tc.desc      ACE
         */
        it('testTabContentFocusablePropNone', Level.LEVEL0, async function(done) {
            console.info('testTabContentFocusablePropNone START');
            console.info("[tab-ContentProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropNone);
            console.info("[tab-ContentProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[tab-ContentProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('tab-Content')
            expect(obj.$attrs.id).assertEqual('focusablePropNone')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTabContentDataProp
         * @tc.desc      ACE
         */
        it('testTabContentDataProp', Level.LEVEL0, async function(done) {
            console.info('testTabContentDataProp START');
            console.info("[tab-ContentProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataProp);
            console.info("[tab-ContentProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[tab-ContentProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('tab-Content')
            expect(obj.$attrs.id).assertEqual('dataProp')
            expect(obj.$attrs.dataTabContent).assertEqual(undefined);
            console.info("[tab-ContentProps] get dataTabC value is: " + JSON.stringify(obj.$attrs.dataTabContent));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTabContentDataPropNone
         * @tc.desc      ACE
         */
        it('testTabContentDataPropNone', Level.LEVEL0, async function(done) {
            console.info('testTabContentDataPropNone START');
            console.info("[tab-ContentProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataPropNone);
            console.info("[tab-ContentProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[tab-ContentProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('tab-Content')
            expect(obj.$attrs.id).assertEqual('dataPropNone')
            expect(obj.$attrs.dataTabContent).assertEqual(undefined)
            console.info("[tab-ContentProps] get dataTabC value is: " + JSON.stringify(obj.$attrs.dataTabContent));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTabContentClickEffectPropSmall
         * @tc.desc      ACE
         */
        it('testTabContentClickEffectPropSmall', Level.LEVEL0, async function(done) {
            console.info('testTabContentClickEffectPropSmall START');
            console.info("[tab-ContentProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropSmall);
            console.info("[tab-ContentProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[tab-ContentProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('tab-Content')
            expect(obj.$attrs.id).assertEqual('clickEffectPropSmall')
            expect(obj.$attrs.clickEffect).assertEqual('spring-small')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTabContentClickEffectPropMedium
         * @tc.desc      ACE
         */
        it('testTabContentClickEffectPropMedium', Level.LEVEL0, async function(done) {
            console.info('testTabContentClickEffectPropMedium START');
            console.info("[tab-ContentProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropMedium);
            console.info("[tab-ContentProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[tab-ContentProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('tab-Content')
            expect(obj.$attrs.id).assertEqual('clickEffectPropMedium')
            expect(obj.$attrs.clickEffect).assertEqual('spring-medium')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTabContentClickEffectPropLarge
         * @tc.desc      ACE
         */
        it('testTabContentClickEffectPropLarge', Level.LEVEL0, async function(done) {
            console.info('testTabContentClickEffectPropLarge START');
            console.info("[tab-ContentProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropLarge);
            console.info("[tab-ContentProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[tab-ContentProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('tab-Content')
            expect(obj.$attrs.id).assertEqual('clickEffectPropLarge')
            expect(obj.$attrs.clickEffect).assertEqual('spring-large')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTabContentClickEffectPropNone
         * @tc.desc      ACE
         */
        it('testTabContentClickEffectPropNone', Level.LEVEL0, async function(done) {
            console.info('testTabContentClickEffectPropNone START');
            console.info("[tab-ContentProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropNone);
            console.info("[tab-ContentProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[tab-ContentProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('tab-Content')
            expect(obj.$attrs.id).assertEqual('clickEffectPropNone')
            expect(obj.$attrs.clickEffect).assertEqual(undefined)
            console.info("[tab-ContentProps] get clickEffect value is: " + JSON.stringify(obj.$attrs.clickEffect));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTabContentDirPropRtl
         * @tc.desc      ACE
         */
        it('testTabContentDirPropRtl', Level.LEVEL0, async function(done) {
            console.info('testTabContentDirPropRtl START');
            console.info("[tab-ContentProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropRtl);
            console.info("[tab-ContentProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[tab-ContentProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('tab-Content')
            expect(obj.$attrs.id).assertEqual('dirPropRtl')
            expect(obj.$attrs.dir).assertEqual('rtl')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTabContentDirPropLtr
         * @tc.desc      ACE
         */
        it('testTabContentDirPropLtr', Level.LEVEL0, async function(done) {
            console.info('testTabContentDirPropLtr START');
            console.info("[tab-ContentProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropLtr);
            console.info("[tab-ContentProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[tab-ContentProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('tab-Content')
            expect(obj.$attrs.id).assertEqual('dirPropLtr')
            expect(obj.$attrs.dir).assertEqual('ltr')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTabContentDirPropAuto
         * @tc.desc      ACE
         */
        it('testTabContentDirPropAuto', Level.LEVEL0, async function(done) {
            console.info('testTabContentDirPropAuto START');
            console.info("[tab-ContentProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropAuto);
            console.info("[tab-ContentProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[tab-ContentProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('tab-Content')
            expect(obj.$attrs.id).assertEqual('dirPropAuto')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTabContentDirPropNone
         * @tc.desc      ACE
         */
        it('testTabContentDirPropNone', Level.LEVEL0, async function(done) {
            console.info('testTabContentDirPropNone START');
            console.info("[tab-ContentProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropNone);
            console.info("[tab-ContentProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[tab-ContentProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('tab-Content')
            expect(obj.$attrs.id).assertEqual('dirPropNone')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTabContentForPropNull
         * @tc.desc      ACE
         */
        it('testTabContentForPropNull', Level.LEVEL0, async function(done) {
            console.info('testTabContentForPropNull START');
            console.info("[tab-ContentProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropNull);
            console.info("[tab-ContentProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[tab-ContentProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('tab-Content')
            expect(obj.$attrs.id).assertEqual('forPropNull')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[tab-ContentProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTabContentForPropOne
         * @tc.desc      ACE
         */
        it('testTabContentForPropOne', Level.LEVEL0, async function(done) {
            console.info('testTabContentForPropOne START');
            console.info("[tab-ContentProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropOne);
            console.info("[tab-ContentProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[tab-ContentProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('tab-Content')
            expect(obj.$attrs.id).assertEqual('forPropOne')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[tab-ContentProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTabContentForPropThree
         * @tc.desc      ACE
         */
        it('testTabContentForPropThree', Level.LEVEL0, async function(done) {
            console.info('testTabContentForPropThree START');
            console.info("[tab-ContentProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropThree);
            console.info("[tab-ContentProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[tab-ContentProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('tab-Content')
            expect(obj.$attrs.id).assertEqual('forPropThree')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[tab-ContentProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTabContentIfPropTrue
         * @tc.desc      ACE
         */
        it('testTabContentIfPropTrue', Level.LEVEL0, async function(done) {
            console.info('testTabContentIfPropTrue START');
            console.info("[tab-ContentProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.ifPropTrue);
            console.info("[tab-ContentProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[tab-ContentProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('tab-Content')
            expect(obj.$attrs.id).assertEqual('ifPropTrue')
            expect(obj.$attrs.if).assertEqual(undefined)
            console.info("[tab-ContentProps] get for value is: " + JSON.stringify(obj.$attrs.if));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTabContentShowPropTrue
         * @tc.desc      ACE
         */
        it('testTabContentShowPropTrue', Level.LEVEL0, async function(done) {
            console.info('testTabContentShowPropTrue START');
            console.info("[tab-ContentProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropTrue);
            console.info("[tab-ContentProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[tab-ContentProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('tab-Content')
            expect(obj.$attrs.id).assertEqual('showPropTrue')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[tab-ContentProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTabContentShowPropFalse
         * @tc.desc      ACE
         */
        it('testTabContentShowPropFalse', Level.LEVEL0, async function(done) {
            console.info('testTabContentShowPropFalse START');
            console.info("[tab-ContentProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropFalse);
            console.info("[tab-ContentProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[tab-ContentProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('tab-Content')
            expect(obj.$attrs.id).assertEqual('showPropFalse')
            expect(obj.$attrs.show).assertEqual('false')
            console.info("[tab-ContentProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTabContentShowPropNone
         * @tc.desc      ACE
         */
        it('testTabContentShowPropNone', Level.LEVEL0, async function(done) {
            console.info('testTabContentShowPropNone START');
            console.info("[tab-ContentProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropNone);
            console.info("[tab-ContentProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[tab-ContentProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('tab-Content')
            expect(obj.$attrs.id).assertEqual('showPropNone')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[tab-ContentProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        //   特有属性

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTabContentScrollableTrue
         * @tc.desc      ACE
         */
        it('testTabContentScrollableTrue', Level.LEVEL0, async function(done) {
            console.info('testTabContentScrollableTrue START');
            console.info("[tab-ContentProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.scrollableTrue);
            console.info("[tab-ContentProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[tab-ContentProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('tab-Content')
            expect(obj.$attrs.id).assertEqual('scrollableTrue')
            expect(obj.$attrs.scrollable).assertEqual('true')
            console.info("[tab-ContentProps] get scrollable value is: " + JSON.stringify(obj.$attrs.scrollable));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTabContentScrollableFalse
         * @tc.desc      ACE
         */
        it('testTabContentScrollableFalse', Level.LEVEL0, async function(done) {
            console.info('testTabContentScrollableFalse START');
            console.info("[tab-ContentProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.scrollableFalse);
            console.info("[tab-ContentProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[tab-ContentProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('tab-Content')
            expect(obj.$attrs.id).assertEqual('scrollableFalse')
            expect(obj.$attrs.scrollable).assertEqual('false')
            console.info("[tab-ContentProps] get scrollable value is: " + JSON.stringify(obj.$attrs.scrollable));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTabContentScrollableNone
         * @tc.desc      ACE
         */
        it('testTabContentScrollableNone', Level.LEVEL0, async function(done) {
            console.info('testTabContentScrollableNone START');
            console.info("[tab-ContentProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.scrollableNone);
            console.info("[tab-ContentProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[tab-ContentProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('tab-Content')
            expect(obj.$attrs.id).assertEqual('scrollableNone')
            expect(obj.$attrs.scrollable).assertEqual(undefined)
            console.info("[tab-ContentProps] get scrollable value is: " + JSON.stringify(obj.$attrs.scrollable));
            done();
        });
    });
}