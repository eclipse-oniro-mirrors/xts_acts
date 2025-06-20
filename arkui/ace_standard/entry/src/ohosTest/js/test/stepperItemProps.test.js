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
    describe('stepperItemPropsJsTest', function() {

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
                }, 500)
            })
            await backToIndexPromise.then(() => {
                return clearPromise;
            })
        }

        /**
         * run before testcase
         */
        beforeAll(async function(done) {
            console.info('[stepperItemPropsJsTest] before each called')

            let result;
            let options = {
                uri: 'pages/stepperItem/prop/index'
            }
            try {
                result = router.push(options)
                console.info("push stepperItemProps page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push stepperItemProps page error " + JSON.stringify(result));
            }
            await sleep(4000)
            done()
        })

        /**
         * run after testcase
         */
        afterAll(async function() {
            console.info('[stepperItemPropsJsTest] after each called')
            await backToIndex()
            await sleep(1000)
        })

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testStepperItemIdProp
         * @tc.desc      ACE
         */
        it('testStepperItemIdProp', Level.LEVEL0, async function(done) {
            console.info('testStepperItemIdProp START');
            console.info("[stepperItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.idProp);
            console.info("[stepperItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[stepperItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('stepper-item')
            expect(obj.$attrs.id).assertEqual('idProp')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testStepperItemClassProp
         * @tc.desc      ACE
         */
        it('testStepperItemClassProp', Level.LEVEL0, async function(done) {
            console.info('testStepperItemClassProp START');
            console.info("[stepperItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classProp);
            console.info("[stepperItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[stepperItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('stepper-item')
            expect(obj.$attrs.id).assertEqual('classProp')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testStepperItemClassPropNone
         * @tc.desc      ACE
         */
        it('testStepperItemClassPropNone', Level.LEVEL0, async function(done) {
            console.info('testStepperItemClassPropNone START');
            console.info("[stepperItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classPropNone);
            console.info("[stepperItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[stepperItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('stepper-item')
            expect(obj.$attrs.id).assertEqual('classPropNone')
            expect(obj.$attrs.className).assertEqual(undefined)
            console.info("[stepperItemProps] get className value is: " + JSON.stringify(obj.$attrs.className));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testStepperItemRefProp
         * @tc.desc      ACE
         */
        it('testStepperItemRefProp', Level.LEVEL0, async function(done) {
            console.info('testStepperItemRefProp START');
            console.info("[stepperItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refProp);
            console.info("[stepperItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[stepperItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('stepper-item')
            expect(obj.$attrs.id).assertEqual('refProp')
            expect(obj.$attrs.ref).assertEqual('refProp')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testStepperItemRefPropNone
         * @tc.desc      ACE
         */
        it('testStepperItemRefPropNone', Level.LEVEL0, async function(done) {
            console.info('testStepperItemRefPropNone START');
            console.info("[stepperItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refPropNone);
            console.info("[stepperItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[stepperItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('stepper-item')
            expect(obj.$attrs.id).assertEqual('refPropNone')
            expect(obj.$attrs.ref).assertEqual(undefined)
            console.info("[stepperItemProps] get ref value is: " + JSON.stringify(obj.$attrs.ref));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testStepperItemDisabledPropTrue
         * @tc.desc      ACE
         */
        it('testStepperItemDisabledPropTrue', Level.LEVEL0, async function(done) {
            console.info('testStepperItemDisabledPropTrue START');
            console.info("[stepperItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropTrue);
            console.info("[stepperItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[stepperItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('stepper-item')
            expect(obj.$attrs.id).assertEqual('disabledPropTrue')
            expect(obj.$attrs.disabled).assertEqual('true')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testStepperItemDisabledPropFalse
         * @tc.desc      ACE
         */
        it('testStepperItemDisabledPropFalse', Level.LEVEL0, async function(done) {
            console.info('testStepperItemDisabledPropFalse START');
            console.info("[stepperItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropFalse);
            console.info("[stepperItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[stepperItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('stepper-item')
            expect(obj.$attrs.id).assertEqual('disabledPropFalse')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testStepperItemDisabledPropNone
         * @tc.desc      ACE
         */
        it('testStepperItemDisabledPropNone', Level.LEVEL0, async function(done) {
            console.info('testStepperItemDisabledPropNone START');
            console.info("[stepperItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropNone);
            console.info("[stepperItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[stepperItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('stepper-item')
            expect(obj.$attrs.id).assertEqual('disabledPropNone')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testStepperItemFocusablePropTrue
         * @tc.desc      ACE
         */
        it('testStepperItemFocusablePropTrue', Level.LEVEL0, async function(done) {
            console.info('testStepperItemFocusablePropTrue START');
            console.info("[stepperItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropTrue);
            console.info("[stepperItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[stepperItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('stepper-item')
            expect(obj.$attrs.id).assertEqual('focusablePropTrue')
            expect(obj.$attrs.focusable).assertEqual('true')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testStepperItemFocusablePropFalse
         * @tc.desc      ACE
         */
        it('testStepperItemFocusablePropFalse', Level.LEVEL0, async function(done) {
            console.info('testStepperItemFocusablePropFalse START');
            console.info("[stepperItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropFalse);
            console.info("[stepperItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[stepperItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('stepper-item')
            expect(obj.$attrs.id).assertEqual('focusablePropFalse')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testStepperItemFocusablePropNone
         * @tc.desc      ACE
         */
        it('testStepperItemFocusablePropNone', Level.LEVEL0, async function(done) {
            console.info('testStepperItemFocusablePropNone START');
            console.info("[stepperItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropNone);
            console.info("[stepperItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[stepperItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('stepper-item')
            expect(obj.$attrs.id).assertEqual('focusablePropNone')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testStepperItemDataProp
         * @tc.desc      ACE
         */
        it('testStepperItemDataProp', Level.LEVEL0, async function(done) {
            console.info('testStepperItemDataProp START');
            console.info("[stepperItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataProp);
            console.info("[stepperItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[stepperItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('stepper-item')
            expect(obj.$attrs.id).assertEqual('dataProp')
            expect(obj.$attrs.dataDiv).assertEqual(undefined);
            console.info("[stepperItemProps] get dataDiv value is: " + JSON.stringify(obj.$attrs.dataDiv));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testStepperItemDataPropNone
         * @tc.desc      ACE
         */
        it('testStepperItemDataPropNone', Level.LEVEL0, async function(done) {
            console.info('testStepperItemDataPropNone START');
            console.info("[stepperItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataPropNone);
            console.info("[stepperItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[stepperItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('stepper-item')
            expect(obj.$attrs.id).assertEqual('dataPropNone')
            expect(obj.$attrs.dataDiv).assertEqual(undefined)
            console.info("[stepperItemProps] get dataDiv value is: " + JSON.stringify(obj.$attrs.dataDiv));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testStepperItemClickEffectPropSmall
         * @tc.desc      ACE
         */
        it('testStepperItemClickEffectPropSmall', Level.LEVEL0, async function(done) {
            console.info('testStepperItemClickEffectPropSmall START');
            console.info("[stepperItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropSmall);
            console.info("[stepperItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[stepperItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('stepper-item')
            expect(obj.$attrs.id).assertEqual('clickEffectPropSmall')
            expect(obj.$attrs.clickEffect).assertEqual('spring-small')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testStepperItemClickEffectPropMedium
         * @tc.desc      ACE
         */
        it('testStepperItemClickEffectPropMedium', Level.LEVEL0, async function(done) {
            console.info('testStepperItemClickEffectPropMedium START');
            console.info("[stepperItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropMedium);
            console.info("[stepperItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[stepperItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('stepper-item')
            expect(obj.$attrs.id).assertEqual('clickEffectPropMedium')
            expect(obj.$attrs.clickEffect).assertEqual('spring-medium')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testStepperItemClickEffectPropLarge
         * @tc.desc      ACE
         */
        it('testStepperItemClickEffectPropLarge', Level.LEVEL0, async function(done) {
            console.info('testStepperItemClickEffectPropLarge START');
            console.info("[stepperItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropLarge);
            console.info("[stepperItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[stepperItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('stepper-item')
            expect(obj.$attrs.id).assertEqual('clickEffectPropLarge')
            expect(obj.$attrs.clickEffect).assertEqual('spring-large')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testStepperItemClickEffectPropNone
         * @tc.desc      ACE
         */
        it('testStepperItemClickEffectPropNone', Level.LEVEL0, async function(done) {
            console.info('testStepperItemClickEffectPropNone START');
            console.info("[stepperItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropNone);
            console.info("[stepperItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[stepperItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('stepper-item')
            expect(obj.$attrs.id).assertEqual('clickEffectPropNone')
            expect(obj.$attrs.clickEffect).assertEqual(undefined)
            console.info("[stepperItemProps] get clickEffect value is: " + JSON.stringify(obj.$attrs.clickEffect));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testStepperItemDirPropRtl
         * @tc.desc      ACE
         */
        it('testStepperItemDirPropRtl', Level.LEVEL0, async function(done) {
            console.info('testStepperItemDirPropRtl START');
            console.info("[stepperItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropRtl);
            console.info("[stepperItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[stepperItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('stepper-item')
            expect(obj.$attrs.id).assertEqual('dirPropRtl')
            expect(obj.$attrs.dir).assertEqual('rtl')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testStepperItemDirPropLtr
         * @tc.desc      ACE
         */
        it('testStepperItemDirPropLtr', Level.LEVEL0, async function(done) {
            console.info('testStepperItemDirPropLtr START');
            console.info("[stepperItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropLtr);
            console.info("[stepperItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[stepperItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('stepper-item')
            expect(obj.$attrs.id).assertEqual('dirPropLtr')
            expect(obj.$attrs.dir).assertEqual('ltr')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testStepperItemDirPropAuto
         * @tc.desc      ACE
         */
        it('testStepperItemDirPropAuto', Level.LEVEL0, async function(done) {
            console.info('testStepperItemDirPropAuto START');
            console.info("[stepperItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropAuto);
            console.info("[stepperItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[stepperItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('stepper-item')
            expect(obj.$attrs.id).assertEqual('dirPropAuto')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testStepperItemDirPropNone
         * @tc.desc      ACE
         */
        it('testStepperItemDirPropNone', Level.LEVEL0, async function(done) {
            console.info('testStepperItemDirPropNone START');
            console.info("[stepperItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropNone);
            console.info("[stepperItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[stepperItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('stepper-item')
            expect(obj.$attrs.id).assertEqual('dirPropNone')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testStepperItemForPropNull
         * @tc.desc      ACE
         */
        it('testStepperItemForPropNull', Level.LEVEL0, async function(done) {
            console.info('testStepperItemForPropNull START');
            console.info("[stepperItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropNull);
            console.info("[stepperItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[stepperItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('stepper-item')
            expect(obj.$attrs.id).assertEqual('forPropNull')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[stepperItemProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testStepperForPropOne
         * @tc.desc      ACE
         */
        it('testStepperItemForPropOne', Level.LEVEL0, async function(done) {
            console.info('testStepperItemForPropOne START');
            console.info("[stepperItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropOne);
            console.info("[stepperItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[stepperItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('stepper-item')
            expect(obj.$attrs.id).assertEqual('forPropOne')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[stepperItemProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testStepperForPropThree
         * @tc.desc      ACE
         */
        it('testStepperItemForPropThree', Level.LEVEL0, async function(done) {
            console.info('testStepperItemForPropThree START');
            console.info("[stepperItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropThree);
            console.info("[stepperItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[stepperItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('stepper-item')
            expect(obj.$attrs.id).assertEqual('forPropThree')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[stepperItemProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testStepperItemIfPropTrue
         * @tc.desc      ACE
         */
        it('testStepperItemIfPropTrue', Level.LEVEL0, async function(done) {
            console.info('testStepperItemIfPropTrue START');
            console.info("[stepperItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.ifPropTrue);
            console.info("[stepperItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[stepperItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('stepper-item')
            expect(obj.$attrs.id).assertEqual('ifPropTrue')
            expect(obj.$attrs.if).assertEqual(undefined)
            console.info("[stepperItemProps] get for value is: " + JSON.stringify(obj.$attrs.if));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testStepperItemShowPropTrue
         * @tc.desc      ACE
         */
        it('testStepperItemShowPropTrue', Level.LEVEL0, async function(done) {
            console.info('testStepperItemShowPropTrue START');
            console.info("[stepperItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropTrue);
            console.info("[stepperItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[stepperItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('stepper-item')
            expect(obj.$attrs.id).assertEqual('showPropTrue')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[stepperItemProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testStepperItemShowPropFalse
         * @tc.desc      ACE
         */
        it('testStepperItemShowPropFalse', Level.LEVEL0, async function(done) {
            console.info('testStepperItemShowPropFalse START');
            console.info("[stepperItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropFalse);
            console.info("[stepperItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[stepperItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('stepper-item')
            expect(obj.$attrs.id).assertEqual('showPropFalse')
            expect(obj.$attrs.show).assertEqual('false')
            console.info("[stepperItemProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testStepperItemShowPropNone
         * @tc.desc      ACE
         */
        it('testStepperItemShowPropNone', Level.LEVEL0, async function(done) {
            console.info('testStepperItemShowPropNone START');
            console.info("[stepperItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropNone);
            console.info("[stepperItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[stepperItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('stepper-item')
            expect(obj.$attrs.id).assertEqual('showPropNone')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[stepperItemProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testStepperItemLabelProp
         * @tc.desc      ACE
         */
        it('testStepperItemLabelProp', Level.LEVEL0, async function(done) {
            console.info('testStepperItemLabelProp START');
            console.info("[stepperItemProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.indexProp);
            console.info("[stepperItemProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[stepperItemProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('stepper-item')
            expect(obj.$attrs.id).assertEqual('labelProp')
            expect(obj.$attrs.label).assertEqual(undefined)
            console.info("[stepperItemProps] get label value is: " + JSON.stringify(obj.$attrs.label));
            done();
        });
    });
}