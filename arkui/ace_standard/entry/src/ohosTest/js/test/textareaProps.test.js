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
    describe('textAreaPropsJsTest', function() {

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
            console.info('[textAreaPropsJsTest] before each called')

            let result;
            let options = {
                uri: 'pages/textArea/prop/index'
            }
            try {
                result = router.push(options)
                console.info("push textAreaProps page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push textAreaProps page error " + JSON.stringify(result));
            }
            await sleep(4000)
            done()
        });

        /**
         * run after testcase
         */
        afterAll(async function() {
            console.info('[textAreaPropsJsTest] after each called')
            await backToIndex()
            await sleep(1000)
        });

        /**
         * @tc.name   testtextAreaIdProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaIdProp', Level.LEVEL0, async function(done) {
            console.info('testtextAreaIdProp START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.idProp);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('idProp')
            done();
        });

        /**
         * @tc.name   testtextAreaClassProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaClassProp', Level.LEVEL0, async function(done) {
            console.info('testtextAreaClassProp START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classProp);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('classProp')
            done();
        });

        /**
         * @tc.name   testtextAreaClassPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaClassPropNone', Level.LEVEL0, async function(done) {
            console.info('testtextAreaClassPropNone START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classPropNone);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('classPropNone')
            expect(obj.$attrs.className).assertEqual(undefined)
            console.info("[textAreaProps] get className value is: " + JSON.stringify(obj.$attrs.className));
            done();
        });

        /**
         * @tc.name   testtextAreaRefProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaRefProp', Level.LEVEL0, async function(done) {
            console.info('testtextAreaRefProp START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refProp);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('refProp')
            expect(obj.$attrs.ref).assertEqual('refProp')
            done();
        });

        /**
         * @tc.name   testtextAreaRefPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaRefPropNone', Level.LEVEL0, async function(done) {
            console.info('testtextAreaRefPropNone START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refPropNone);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('refPropNone')
            expect(obj.$attrs.ref).assertEqual(undefined)
            console.info("[textAreaProps] get ref value is: " + JSON.stringify(obj.$attrs.ref));
            done();
        });

        /**
         * @tc.name   testtextAreaDisabledPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaDisabledPropTrue', Level.LEVEL0, async function(done) {
            console.info('testtextAreaDisabledPropTrue START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropTrue);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('disabledPropTrue')
            expect(obj.$attrs.disabled).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testtextAreaDisabledPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaDisabledPropFalse', Level.LEVEL0, async function(done) {
            console.info('testtextAreaDisabledPropFalse START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropFalse);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('disabledPropFalse')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testtextAreaDisabledPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaDisabledPropNone', Level.LEVEL0, async function(done) {
            console.info('testtextAreaDisabledPropNone START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropNone);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('disabledPropNone')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testtextAreaFocusablePropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaFocusablePropTrue', Level.LEVEL0, async function(done) {
            console.info('testtextAreaFocusablePropTrue START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropTrue);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('focusablePropTrue')
            expect(obj.$attrs.focusable).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testtextAreaFocusablePropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaFocusablePropFalse', Level.LEVEL0, async function(done) {
            console.info('testtextAreaFocusablePropFalse START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropFalse);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('focusablePropFalse')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testtextAreaFocusablePropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaFocusablePropNone', Level.LEVEL0, async function(done) {
            console.info('testtextAreaFocusablePropNone START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropNone);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('focusablePropNone')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testtextAreaDataProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaDataProp', Level.LEVEL0, async function(done) {
            console.info('testtextAreaDataProp START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataProp);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('dataProp')
            expect(obj.$attrs.datatextArea).assertEqual(undefined);
            console.info("[textAreaProps] get datatextArea value is: " + JSON.stringify(obj.$attrs.datatextArea));
            done();
        });

        /**
         * @tc.name   testtextAreaDataPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaDataPropNone', Level.LEVEL0, async function(done) {
            console.info('testtextAreaDataPropNone START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataPropNone);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('dataPropNone')
            expect(obj.$attrs.datatextArea).assertEqual(undefined)
            console.info("[textAreaProps] get datatextArea value is: " + JSON.stringify(obj.$attrs.datatextArea));
            done();
        });

        /**
         * @tc.name   testtextAreaClickEffectPropSmall
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaClickEffectPropSmall', Level.LEVEL0, async function(done) {
            console.info('testtextAreaClickEffectPropSmall START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropSmall);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('clickEffectPropSmall')
            expect(obj.$attrs.clickEffect).assertEqual('spring-small')
            done();
        });

        /**
         * @tc.name   testtextAreaClickEffectPropMedium
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaClickEffectPropMedium', Level.LEVEL0, async function(done) {
            console.info('testtextAreaClickEffectPropMedium START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropMedium);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('clickEffectPropMedium')
            expect(obj.$attrs.clickEffect).assertEqual('spring-medium')
            done();
        });

        /**
         * @tc.name   testtextAreaClickEffectPropLarge
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaClickEffectPropLarge', Level.LEVEL0, async function(done) {
            console.info('testtextAreaClickEffectPropLarge START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropLarge);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('clickEffectPropLarge')
            expect(obj.$attrs.clickEffect).assertEqual('spring-large')
            done();
        });

        /**
         * @tc.name   testtextAreaClickEffectPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaClickEffectPropNone', Level.LEVEL0, async function(done) {
            console.info('testtextAreaClickEffectPropNone START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropNone);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('clickEffectPropNone')
            expect(obj.$attrs.clickEffect).assertEqual(undefined)
            console.info("[textAreaProps] get clickEffect value is: " + JSON.stringify(obj.$attrs.clickEffect));
            done();
        });

        /**
         * @tc.name   testtextAreaDirPropRtl
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaDirPropRtl', Level.LEVEL0, async function(done) {
            console.info('testtextAreaDirPropRtl START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropRtl);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('dirPropRtl')
            expect(obj.$attrs.dir).assertEqual('rtl')
            done();
        });

        /**
         * @tc.name   testtextAreaDirPropLtr
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaDirPropLtr', Level.LEVEL0, async function(done) {
            console.info('testtextAreaDirPropLtr START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropLtr);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('dirPropLtr')
            expect(obj.$attrs.dir).assertEqual('ltr')
            done();
        });

        /**
         * @tc.name   testtextAreaDirPropAuto
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaDirPropAuto', Level.LEVEL0, async function(done) {
            console.info('testtextAreaDirPropAuto START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropAuto);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('dirPropAuto')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testtextAreaDirPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaDirPropNone', Level.LEVEL0, async function(done) {
            console.info('testtextAreaDirPropNone START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropNone);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('dirPropNone')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testtextAreaForPropNull
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaForPropNull', Level.LEVEL0, async function(done) {
            console.info('testtextAreaForPropNull START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropNull);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('forPropNull')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[textAreaProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testtextAreaForPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaForPropOne', Level.LEVEL0, async function(done) {
            console.info('testtextAreaForPropOne START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropOne);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('forPropOne')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[textAreaProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testtextAreaForPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaForPropThree', Level.LEVEL0, async function(done) {
            console.info('testtextAreaForPropThree START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropThree);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('forPropThree')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[textAreaProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testtextAreaIfPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaIfPropTrue', Level.LEVEL0, async function(done) {
            console.info('testtextAreaIfPropTrue START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.ifPropTrue);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('ifPropTrue')
            expect(obj.$attrs.if).assertEqual(undefined)
            console.info("[textAreaProps] get for value is: " + JSON.stringify(obj.$attrs.if));
            done();
        });

        /**
         * @tc.name   testtextAreaShowPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaShowPropTrue', Level.LEVEL0, async function(done) {
            console.info('testtextAreaShowPropTrue START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropTrue);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('showPropTrue')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[textAreaProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testtextAreaShowPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaShowPropFalse', Level.LEVEL0, async function(done) {
            console.info('testtextAreaShowPropFalse START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropFalse);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('showPropFalse')
            expect(obj.$attrs.show).assertEqual('false')
            console.info("[textAreaProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testtextAreaShowPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaShowPropNone', Level.LEVEL0, async function(done) {
            console.info('testtextAreaShowPropNone START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropNone);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('showPropNone')
            expect(obj.$attrs.show).assertEqual("true")
            console.info("[textAreaProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testtextAreaPlaceholderPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaPlaceholderPropNone', Level.LEVEL0, async function(done) {
            console.info('testtextAreaXsPropNone START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.placeholderNone);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('placeholderNone')
            expect(obj.$attrs.placeholder).assertEqual(undefined)
            console.info("[textAreaProps] get placeholder value is: " + JSON.stringify(obj.$attrs.placeholder));
            done();
        });

        /**
         * @tc.name   testtextAreaPlaceholderProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaPlaceholderProp', Level.LEVEL0, async function(done) {
            console.info('testtextAreaXsPropNone START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.placeholder);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('placeholder')
            expect(obj.$attrs.placeholder).assertEqual('please--input')
            console.info("[textAreaProps] get placeholder value is: " + JSON.stringify(obj.$attrs.placeholder));
            done();
        });

        /**
         * @tc.name   testtextAreaMaxlengthProp20
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaMaxlengthProp20', Level.LEVEL0, async function(done) {
            console.info('testtextAreaXsPropNone START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.maxlength20);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('maxlength20')
            expect(obj.$attrs.maxlength).assertEqual('20')
            console.info("[textAreaProps] get maxlength value is: " + JSON.stringify(obj.$attrs.maxlength));
            done();
        });

        /**
         * @tc.name   testtextAreaHeadericonPropNull
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaHeadericonPropNull', Level.LEVEL0, async function(done) {
            console.info('testtextAreaXsPropObject START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.headericonNone);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('headericonNone')
            expect(obj.$attrs.headericon).assertEqual(undefined)
            console.info("[textAreaProps] get headericon value is: " + JSON.stringify(obj.$attrs.headericon));
            done();
        });

        /**
         * @tc.name   testtextAreaHeadericonProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaHeadericonProp', Level.LEVEL0, async function(done) {
            console.info('testtextAreaXsPropObject START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.headericon);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('headericon')
            expect(obj.$attrs.headericon).assertEqual("common/images/icon.png")
            console.info("[textAreaProps] get headericon value is: " + JSON.stringify(obj.$attrs.headericon));
            done();
        });

        /**
         * @tc.name   testtextAreaExtendPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaExtendPropNone', Level.LEVEL0, async function(done) {
            console.info('testtextAreaXsPropObject START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.extendNone);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('extendNone')
            expect(obj.$attrs.extend).assertEqual("false")
            console.info("[textAreaProps] get extend value is: " + JSON.stringify(obj.$attrs.extend));
            done();
        });

        /**
         * @tc.name   testtextAreaExtendPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaExtendPropFalse', Level.LEVEL0, async function(done) {
            console.info('testtextAreaXsPropObject START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.extendFalse);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('extendFalse')
            expect(obj.$attrs.extend).assertEqual("false")
            console.info("[textAreaProps] get extend value is: " + JSON.stringify(obj.$attrs.extend));
            done();
        });

        /**
         * @tc.name   testtextAreaExtendProptTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaExtendProptTrue', Level.LEVEL0, async function(done) {
            console.info('testtextAreaXsPropObject START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.extendTrue);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('extendTrue')
            expect(obj.$attrs.extend).assertEqual("true")
            console.info("[textAreaProps] get extend value is: " + JSON.stringify(obj.$attrs.extend));
            done();
        });

        /**
         * @tc.name   testtextAreaValuePropNull
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaValuePropNull', Level.LEVEL0, async function(done) {
            console.info('testtextAreaXsPropObject START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.valueNone);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('valueNone')
            expect(obj.$attrs.value).assertEqual(undefined)
            console.info("[textAreaProps] get value value is: " + JSON.stringify(obj.$attrs.value));
            done();
        });

        /**
         * @tc.name   testtextAreaValueProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaValueProp', Level.LEVEL0, async function(done) {
            console.info('testtextAreaXsPropObject START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.value);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('value')
            expect(obj.$attrs.value).assertEqual("text")
            console.info("[textAreaProps] get value value is: " + JSON.stringify(obj.$attrs.value));
            done();
        });

        /**
         * @tc.name   testtextAreaShowcounterPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaShowcounterPropNone', Level.LEVEL0, async function(done) {
            console.info('testtextAreaXsPropObject START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showcounterNone);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('showcounterNone')
            expect(obj.$attrs.showcounter).assertEqual("false")
            console.info("[textAreaProps] get showcounter value is: " + JSON.stringify(obj.$attrs.showcounter));
            done();
        });

        /**
         * @tc.name   testtextAreaShowcounterPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaShowcounterPropFalse', Level.LEVEL0, async function(done) {
            console.info('testtextAreaXsPropObject START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showcounterFalse);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('showcounterFalse')
            expect(obj.$attrs.showcounter).assertEqual("false")
            console.info("[textAreaProps] get showcounter value is: " + JSON.stringify(obj.$attrs.showcounter));
            done();
        });

        /**
         * @tc.name   testtextAreaShowcounterProptTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaShowcounterProptTrue', Level.LEVEL0, async function(done) {
            console.info('testtextAreaXsPropObject START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showcounterTrue);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('showcounterTrue')
            expect(obj.$attrs.showcounter).assertEqual("true")
            console.info("[textAreaProps] get showcounter value is: " + JSON.stringify(obj.$attrs.showcounter));
            done();
        });

        /**
         * @tc.name   testtextAreaAutofocusPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaAutofocusPropNone', Level.LEVEL0, async function(done) {
            console.info('testtextAreaXsPropObject START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.autofocusNone);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('autofocusNone')
            expect(obj.$attrs.autofocus).assertEqual("false")
            console.info("[textAreaProps] get autofocus value is: " + JSON.stringify(obj.$attrs.autofocus));
            done();
        });

        /**
         * @tc.name   testtextAreaAutofocusPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaAutofocusPropFalse', Level.LEVEL0, async function(done) {
            console.info('testtextAreaXsPropObject START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.autofocusFalse);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('autofocusFalse')
            expect(obj.$attrs.autofocus).assertEqual("false")
            console.info("[textAreaProps] get autofocus value is: " + JSON.stringify(obj.$attrs.autofocus));
            done();
        });

        /**
         * @tc.name   testtextAreaAutofocusProptTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaAutofocusProptTrue', Level.LEVEL0, async function(done) {
            console.info('testtextAreaXsPropObject START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.autofocusTrue);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('autofocusTrue')
            expect(obj.$attrs.autofocus).assertEqual("true")
            console.info("[textAreaProps] get autofocus value is: " + JSON.stringify(obj.$attrs.autofocus));
            done();
        });

        /**
         * @tc.name   testtextAreaSoftkeyboardenabledPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaSoftkeyboardenabledPropNone', Level.LEVEL0, async function(done) {
            console.info('testtextAreaXsPropObject START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.softkeyboardenabledNone);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('softkeyboardenabledNone')
            expect(obj.$attrs.softkeyboardenabled).assertEqual("true")
            console.info("[textAreaProps] get softkey value is: " + JSON.stringify(obj.$attrs.softkey));
            done();
        });

        /**
         * @tc.name   testtextAreaSoftkeyboardenabledPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaSoftkeyboardenabledPropFalse', Level.LEVEL0, async function(done) {
            console.info('testtextAreaXsPropObject START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.softkeyboardenabledFalse);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('softkeyboardenabledFalse')
            expect(obj.$attrs.softkeyboardenabled).assertEqual("false")
            console.info("[textAreaProps] get softkey value is: " + JSON.stringify(obj.$attrs.softkey));
            done();
        });

        /**
         * @tc.name   testtextAreaSoftkeyboardenabledProptTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaSoftkeyboardenabledProptTrue', Level.LEVEL0, async function(done) {
            console.info('testtextAreaXsPropObject START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.softkeyboardenabledTrue);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('softkeyboardenabledTrue')
            expect(obj.$attrs.softkeyboardenabled).assertEqual("true")
            console.info("[textAreaProps] get softkey value is: " + JSON.stringify(obj.$attrs.softkey));
            done();
        });

        /**
         * @tc.name   testtextAreaMenuoptionsPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaMenuoptionsPropNone', Level.LEVEL0, async function(done) {
            console.info('testtextAreaXsPropObject START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.menuoptionsNone);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('menuoptionsNone')
            expect(obj.$attrs.menuoptions).assertEqual(undefined)
            console.info("[textAreaProps] get menuoptions value is: " + JSON.stringify(obj.$attrs.menuoptions));
            done();
        });

        /**
         * @tc.name   testtextAreaMenuoptionsProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaMenuoptionsProp', Level.LEVEL0, async function(done) {
            console.info('testtextAreaXsPropObject START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.menuoptions);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('menuoptions')
            expect(obj.$attrs.menuoptions).assertEqual(undefined)
            console.info("[textAreaProps] get menuoptions value is: " + JSON.stringify(obj.$attrs.menuoptions));
            done();
        });

        /**
         * @tc.name   testtextAreaSelectedstartPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaSelectedstartPropNone', Level.LEVEL0, async function(done) {
            console.info('testtextAreaXsPropObject START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.selectedstartNone);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('selectedstartNone')
            expect(obj.$attrs.selectedstart).assertEqual("-1")
            console.info("[textAreaProps] get selectedstart value is: " + JSON.stringify(obj.$attrs.selectedstart));
            done();
        });

        /**
         * @tc.name   testtextAreaSelectedstartProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaSelectedstartProp', Level.LEVEL0, async function(done) {
            console.info('testtextAreaXsPropObject START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.selectedstart5);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('selectedstart5')
            expect(obj.$attrs.selectedstart).assertEqual("5")
            console.info("[textAreaProps] get selectedstart value is: " + JSON.stringify(obj.$attrs.selectedstart));
            done();
        });

        /**
         * @tc.name   testtextAreaSelectedEndtPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaSelectedEndtPropNone', Level.LEVEL0, async function(done) {
            console.info('testtextAreaXsPropObject START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.selectedendNone);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('selectedendNone')
            expect(obj.$attrs.selectedend).assertEqual("-1")
            console.info("[textAreaProps] get selectedend value is: " + JSON.stringify(obj.$attrs.selectedend));
            done();
        });

        /**
         * @tc.name   testtextAreaSelectedEndProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testtextAreaSelectedEndProp', Level.LEVEL0, async function(done) {
            console.info('testtextAreaXsPropObject START');
            console.info("[textAreaProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.selectedend5);
            console.info("[textAreaProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[textAreaProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('textarea')
            expect(obj.$attrs.id).assertEqual('selectedend5')
            expect(obj.$attrs.selectedend).assertEqual("5")
            console.info("[textAreaProps] get selectedend value is: " + JSON.stringify(obj.$attrs.selectedend));
            done();
        });
    });
}