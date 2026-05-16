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


export default function dialogPropsJsTest() {
    describe('dialogPropsJsTest', function() {

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
                    })
                    resolve()
                }, 500)
            })
            let clearPromise = new Promise((resolve, reject) => {
                setTimeout(() => {
                    router.clear()
                    resolve()
                }, 500);
            })
            await backToIndexPromise.then(() => {
                return clearPromise
            })
        }

        /**
         * run before testcase
         */
        beforeAll(async function(done) {
            console.info('[dialogPropsJsTest] before each called')

            let result;
            let options = {
                uri: 'pages/dialog/prop/index'
            }
            try {
                result = router.push(options)
                console.info("push dialogProps page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push dialogProps page error " + JSON.stringify(result));
            }
            await sleep(4000)
            done()
        })

        /**
         * run after testcase
         */
        afterAll(async function() {
            console.info('[dialogPropsJsTest] after each called')
            await backToIndex();
            await sleep(1000)
        })

        // 通用属性

        /**
         * @tc.name   testdialogIdProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testdialogIdProp', Level.LEVEL0, async function(done) {
            console.info('testdialogIdProp START');
            console.info("[dialogProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.idProp);
            console.info("[dialogProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[dialogProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('dialog')
            expect(obj.$attrs.id).assertEqual('idProp')
            done();
        })

        /**
         * @tc.name   testdialogClassProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testdialogClassProp', Level.LEVEL0, async function(done) {
            console.info('testdialogClassProp START');
            console.info("[dialogProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classProp);
            console.info("[dialogProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[dialogProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('dialog')
            expect(obj.$attrs.id).assertEqual('classProp')
            expect(obj.$attrs.className).assertEqual('classProp')
            done();
        })

        /**
         * @tc.name   testdialogClassPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testdialogClassPropNone', Level.LEVEL0, async function(done) {
            console.info('testdialogClassPropNone START');
            console.info("[dialogProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classPropNone);
            console.info("[dialogProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[dialogProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('dialog')
            expect(obj.$attrs.id).assertEqual('classPropNone')
            expect(obj.$attrs.className).assertEqual(undefined)
            console.info("[dialogProps] get className value is: " + JSON.stringify(obj.$attrs.className));
            done();
        })

        /**
         * @tc.name   testdialogRefProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testdialogRefProp', Level.LEVEL0, async function(done) {
            console.info('testdialogRefProp START');
            console.info("[dialogProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refProp);
            console.info("[dialogProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[dialogProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('dialog')
            expect(obj.$attrs.id).assertEqual('refProp')
            expect(obj.$attrs.ref).assertEqual('refProp')
            done();
        });

        /**
         * @tc.name   testdialogRefPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testdialogRefPropNone', Level.LEVEL0, async function(done) {
            console.info('testdialogRefPropNone START');
            console.info("[dialogProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refPropNone);
            console.info("[dialogProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[dialogProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('dialog')
            expect(obj.$attrs.id).assertEqual('refPropNone')
            expect(obj.$attrs.ref).assertEqual(undefined)
            console.info("[dialogProps] get ref value is: " + JSON.stringify(obj.$attrs.ref));
            done();
        });

        /**
         * @tc.name   testdialogDisabledPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testdialogDisabledPropTrue', Level.LEVEL0, async function(done) {
            console.info('testdialogDisabledPropTrue START');
            console.info("[dialogProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropTrue);
            console.info("[dialogProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[dialogProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('dialog')
            expect(obj.$attrs.id).assertEqual('disabledPropTrue')
            expect(obj.$attrs.disabled).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testdialogDisabledPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testdialogDisabledPropFalse', Level.LEVEL0, async function(done) {
            console.info('testdialogDisabledPropFalse START');
            console.info("[dialogProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropFalse);
            console.info("[dialogProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[dialogProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('dialog')
            expect(obj.$attrs.id).assertEqual('disabledPropFalse')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testdialogDisabledPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testdialogDisabledPropNone', Level.LEVEL0, async function(done) {
            console.info('testdialogDisabledPropNone START');
            console.info("[dialogProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropNone);
            console.info("[dialogProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[dialogProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('dialog')
            expect(obj.$attrs.id).assertEqual('disabledPropNone')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testdialogFocusablePropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testdialogFocusablePropTrue', Level.LEVEL0, async function(done) {
            console.info('testdialogFocusablePropTrue START');
            console.info("[dialogProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropTrue);
            console.info("[dialogProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[dialogProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('dialog')
            expect(obj.$attrs.id).assertEqual('focusablePropTrue')
            expect(obj.$attrs.focusable).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testdialogFocusablePropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testdialogFocusablePropFalse', Level.LEVEL0, async function(done) {
            console.info('testdialogFocusablePropFalse START');
            console.info("[dialogProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropFalse);
            console.info("[dialogProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[dialogProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('dialog')
            expect(obj.$attrs.id).assertEqual('focusablePropFalse')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testdialogFocusablePropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testdialogFocusablePropNone', Level.LEVEL0, async function(done) {
            console.info('testdialogFocusablePropNone START');
            console.info("[dialogProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropNone);
            console.info("[dialogProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[dialogProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('dialog')
            expect(obj.$attrs.id).assertEqual('focusablePropNone')
            expect(obj.$attrs.focusable).assertEqual(undefined)
            done();
        });

        /**
         * @tc.name   testdialogDataProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testdialogDataProp', Level.LEVEL0, async function(done) {
            console.info('testdialogDataProp START');
            console.info("[dialogProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataProp);
            console.info("[dialogProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[dialogProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('dialog')
            expect(obj.$attrs.id).assertEqual('dataProp')
            expect(obj.$attrs.datadialog).assertEqual(undefined);
            console.info("[dialogProps] get datadialog value is: " + JSON.stringify(obj.$attrs.datadialog));
            done();
        });

        /**
         * @tc.name   testdialogDataPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testdialogDataPropNone', Level.LEVEL0, async function(done) {
            console.info('testdialogDataPropNone START');
            console.info("[dialogProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataPropNone);
            console.info("[dialogProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[dialogProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('dialog')
            expect(obj.$attrs.id).assertEqual('dataPropNone')
            expect(obj.$attrs.datadialog).assertEqual(undefined)
            console.info("[dialogProps] get datadialog value is: " + JSON.stringify(obj.$attrs.datadialog));
            done();
        });

        /**
         * @tc.name   testdialogClickEffectPropSmall
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testdialogClickEffectPropSmall', Level.LEVEL0, async function(done) {
            console.info('testdialogClickEffectPropSmall START');
            console.info("[dialogProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropSmall);
            console.info("[dialogProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[dialogProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('dialog')
            expect(obj.$attrs.id).assertEqual('clickEffectPropSmall')
            expect(obj.$attrs.clickEffect).assertEqual('spring-small')
            done();
        });

        /**
         * @tc.name   testdialogClickEffectPropMedium
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testdialogClickEffectPropMedium', Level.LEVEL0, async function(done) {
            console.info('testdialogClickEffectPropMedium START');
            console.info("[dialogProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropMedium);
            console.info("[dialogProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[dialogProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('dialog')
            expect(obj.$attrs.id).assertEqual('clickEffectPropMedium')
            expect(obj.$attrs.clickEffect).assertEqual('spring-medium')
            done();
        });

        /**
         * @tc.name   testdialogClickEffectPropLarge
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testdialogClickEffectPropLarge', Level.LEVEL0, async function(done) {
            console.info('testdialogClickEffectPropLarge START');
            console.info("[dialogProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropLarge);
            console.info("[dialogProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[dialogProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('dialog')
            expect(obj.$attrs.id).assertEqual('clickEffectPropLarge')
            expect(obj.$attrs.clickEffect).assertEqual('spring-large')
            done();
        });

        /**
         * @tc.name   testdialogClickEffectPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testdialogClickEffectPropNone', Level.LEVEL0, async function(done) {
            console.info('testdialogClickEffectPropNone START');
            console.info("[dialogProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropNone);
            console.info("[dialogProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[dialogProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('dialog')
            expect(obj.$attrs.id).assertEqual('clickEffectPropNone')
            expect(obj.$attrs.clickEffect).assertEqual(undefined)
            console.info("[dialogProps] get clickEffect value is: " + JSON.stringify(obj.$attrs.clickEffect));
            done();
        });

        /**
         * @tc.name   testdialogDirPropRtl
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testdialogDirPropRtl', Level.LEVEL0, async function(done) {
            console.info('testdialogDirPropRtl START');
            console.info("[dialogProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropRtl);
            console.info("[dialogProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[dialogProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('dialog')
            expect(obj.$attrs.id).assertEqual('dirPropRtl')
            expect(obj.$attrs.dir).assertEqual('rtl')
            done();
        });

        /**
         * @tc.name   testdialogDirPropLtr
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testdialogDirPropLtr', Level.LEVEL0, async function(done) {
            console.info('testdialogDirPropLtr START');
            console.info("[dialogProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropLtr);
            console.info("[dialogProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[dialogProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('dialog')
            expect(obj.$attrs.id).assertEqual('dirPropLtr')
            expect(obj.$attrs.dir).assertEqual('ltr')
            done();
        });

        /**
         * @tc.name   testdialogDirPropAuto
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testdialogDirPropAuto', Level.LEVEL0, async function(done) {
            console.info('testdialogDirPropAuto START');
            console.info("[dialogProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropAuto);
            console.info("[dialogProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[dialogProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('dialog')
            expect(obj.$attrs.id).assertEqual('dirPropAuto')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testdialogDirPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testdialogDirPropNone', Level.LEVEL0, async function(done) {
            console.info('testdialogDirPropNone START');
            console.info("[dialogProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropNone);
            console.info("[dialogProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[dialogProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('dialog')
            expect(obj.$attrs.id).assertEqual('dirPropNone')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testdialogForPropNull
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testdialogForPropNull', Level.LEVEL0, async function(done) {
            console.info('testdialogForPropNull START');
            console.info("[dialogProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropNull);
            console.info("[dialogProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[dialogProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('dialog')
            expect(obj.$attrs.id).assertEqual('forPropNull')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[dialogProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testdialogForPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testdialogForPropOne', Level.LEVEL0, async function(done) {
            console.info('testdialogForPropOne START');
            console.info("[dialogProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropOne);
            console.info("[dialogProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[dialogProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('dialog')
            expect(obj.$attrs.id).assertEqual('forPropOne')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[dialogProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testdialogForPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testdialogForPropThree', Level.LEVEL0, async function(done) {
            console.info('testdialogForPropThree START');
            console.info("[dialogProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropThree);
            console.info("[dialogProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[dialogProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('dialog')
            expect(obj.$attrs.id).assertEqual('forPropThree')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[dialogProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testdialogIfPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testdialogIfPropTrue', Level.LEVEL0, async function(done) {
            console.info('testdialogIfPropTrue START');
            console.info("[dialogProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.ifPropTrue);
            console.info("[dialogProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[dialogProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('dialog')
            expect(obj.$attrs.id).assertEqual('ifPropTrue')
            expect(obj.$attrs.if).assertEqual(undefined)
            console.info("[dialogProps] get for value is: " + JSON.stringify(obj.$attrs.if));
            done();
        });

        /**
         * @tc.name   testdialogShowPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testdialogShowPropTrue', Level.LEVEL0, async function(done) {
            console.info('testdialogShowPropTrue START');
            console.info("[dialogProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropTrue);
            console.info("[dialogProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[dialogProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('dialog')
            expect(obj.$attrs.id).assertEqual('showPropTrue')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[dialogProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testdialogShowPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testdialogShowPropFalse', Level.LEVEL0, async function(done) {
            console.info('testdialogShowPropFalse START');
            console.info("[dialogProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropFalse);
            console.info("[dialogProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[dialogProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('dialog')
            expect(obj.$attrs.id).assertEqual('showPropFalse')
            expect(obj.$attrs.show).assertEqual('false')
            console.info("[dialogProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testdialogShowPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testdialogShowPropNone', Level.LEVEL0, async function(done) {
            console.info('testdialogShowPropNone START');
            console.info("[dialogProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropNone);
            console.info("[dialogProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[dialogProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('dialog')
            expect(obj.$attrs.id).assertEqual('showPropNone')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[dialogProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        // 特有属性

        /**
         * @tc.name   testdialogdragableNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testdialogdragableNone', Level.LEVEL0, async function(done) {
            console.info('testdialogdragableNone START');
            console.info("[dialogProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dragableNone);
            console.info("[dialogProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[dialogProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('dialog')
            expect(obj.$attrs.id).assertEqual('dragableNone')
            expect(obj.$attrs.dragable).assertEqual('false')
            console.info("[dialogProps] get dragable value is: " + JSON.stringify(obj.$attrs.dragable));
            done();
        });

        /**
         * @tc.name   testdialogdragableTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testdialogdragableTrue', Level.LEVEL0, async function(done) {
            console.info('testdialogdragableTrue START');
            console.info("[dialogProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dragableTrue);
            console.info("[dialogProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[dialogProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('dialog')
            expect(obj.$attrs.id).assertEqual('dragableTrue')
            expect(obj.$attrs.dragable).assertEqual('true')
            console.info("[dialogProps] get dragable value is: " + JSON.stringify(obj.$attrs.dragable));
            done();
        });

        /**
         * @tc.name   testdialogdragableFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testdialogdragableFalse', Level.LEVEL0, async function(done) {
            console.info('testdialogdragableFalse START');
            console.info("[dialogProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dragableFalse);
            console.info("[dialogProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[dialogProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('dialog')
            expect(obj.$attrs.id).assertEqual('dragableFalse')
            expect(obj.$attrs.dragable).assertEqual('false')
            console.info("[dialogProps] get dragable value is: " + JSON.stringify(obj.$attrs.dragable));
            done();
        });
    });
}