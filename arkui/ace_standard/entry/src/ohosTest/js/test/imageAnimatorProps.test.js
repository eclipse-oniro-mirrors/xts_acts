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


export default function imageAnimatorPropsJsTest() {
    describe('imageAnimatorPropsJsTest', function() {

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
            console.info('[imageAnimatorPropsJsTest] before each called')

            let result;
            let options = {
                uri: 'pages/imageAnimator/prop/index'
            }
            try {
                result = router.push(options)
                console.info("push imageAnimatorProps page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push imageAnimatorProps page error " + JSON.stringify(result));
            }
            await sleep(4000)
            done()
        });

        /**
         * run after testcase
         */
        afterAll(async function() {
            console.info('[imageAnimatorPropsJsTest] after each called')
            await backToIndex()
            await sleep(1000)
        });

        /**
         * @tc.name   testimageAnimatorIdProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorIdProp', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorIdProp START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.idProp);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('idProp')
            done();
        });

        /**
         * @tc.name   testimageAnimatorClassProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorClassProp', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorClassProp START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classProp);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('classProp')
            done();
        });

        /**
         * @tc.name   testimageAnimatorClassPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorClassPropNone', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorClassPropNone START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classPropNone);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('classPropNone')
            expect(obj.$attrs.className).assertEqual(undefined)
            console.info("[imageAnimatorProps] get className value is: " + JSON.stringify(obj.$attrs.className));
            done();
        });

        /**
         * @tc.name   testimageAnimatorRefProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorRefProp', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorRefProp START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refProp);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('refProp')
            expect(obj.$attrs.ref).assertEqual('refProp')
            done();
        });

        /**
         * @tc.name   testimageAnimatorRefPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorRefPropNone', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorRefPropNone START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refPropNone);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('refPropNone')
            expect(obj.$attrs.ref).assertEqual(undefined)
            console.info("[imageAnimatorProps] get ref value is: " + JSON.stringify(obj.$attrs.ref));
            done();
        });

        /**
         * @tc.name   testimageAnimatorDisabledPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorDisabledPropTrue', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorDisabledPropTrue START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropTrue);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('disabledPropTrue')
            expect(obj.$attrs.disabled).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testimageAnimatorDisabledPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorDisabledPropFalse', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorDisabledPropFalse START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropFalse);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('disabledPropFalse')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testimageAnimatorDisabledPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorDisabledPropNone', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorDisabledPropNone START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropNone);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('disabledPropNone')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testimageAnimatorFocusablePropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorFocusablePropTrue', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorFocusablePropTrue START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropTrue);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('focusablePropTrue')
            expect(obj.$attrs.focusable).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testimageAnimatorFocusablePropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorFocusablePropFalse', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorFocusablePropFalse START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropFalse);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('focusablePropFalse')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testimageAnimatorFocusablePropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorFocusablePropNone', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorFocusablePropNone START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropNone);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('focusablePropNone')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testimageAnimatorDataProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorDataProp', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorDataProp START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataProp);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('dataProp')
            expect(obj.$attrs.data).assertEqual(undefined);
            console.info("[imageAnimatorProps] get data value is: " + JSON.stringify(obj.$attrs.data));
            done();
        });

        /**
         * @tc.name   testimageAnimatorDataPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorDataPropNone', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorDataPropNone START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataPropNone);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('dataPropNone')
            expect(obj.$attrs.data).assertEqual(undefined)
            console.info("[imageAnimatorProps] get data value is: " + JSON.stringify(obj.$attrs.data));
            done();
        });

        /**
         * @tc.name   testimageAnimatorClickEffectPropSmall
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorClickEffectPropSmall', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorClickEffectPropSmall START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropSmall);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('clickEffectPropSmall')
            expect(obj.$attrs.clickEffect).assertEqual('spring-small')
            done();
        });

        /**
         * @tc.name   testimageAnimatorClickEffectPropMedium
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorClickEffectPropMedium', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorClickEffectPropMedium START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropMedium);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('clickEffectPropMedium')
            expect(obj.$attrs.clickEffect).assertEqual('spring-medium')
            done();
        });

        /**
         * @tc.name   testimageAnimatorClickEffectPropLarge
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorClickEffectPropLarge', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorClickEffectPropLarge START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropLarge);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('clickEffectPropLarge')
            expect(obj.$attrs.clickEffect).assertEqual('spring-large')
            done();
        });

        /**
         * @tc.name   testimageAnimatorClickEffectPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorClickEffectPropNone', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorClickEffectPropNone START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropNone);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('clickEffectPropNone')
            expect(obj.$attrs.clickEffect).assertEqual(undefined)
            console.info("[imageAnimatorProps] get clickEffect value is: " + JSON.stringify(obj.$attrs.clickEffect));
            done();
        });

        /**
         * @tc.name   testimageAnimatorDirPropRtl
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorDirPropRtl', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorDirPropRtl START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropRtl);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('dirPropRtl')
            expect(obj.$attrs.dir).assertEqual('rtl')
            done();
        });

        /**
         * @tc.name   testimageAnimatorDirPropLtr
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorDirPropLtr', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorDirPropLtr START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropLtr);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('dirPropLtr')
            expect(obj.$attrs.dir).assertEqual('ltr')
            done();
        });

        /**
         * @tc.name   testimageAnimatorDirPropAuto
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorDirPropAuto', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorDirPropAuto START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropAuto);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('dirPropAuto')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testimageAnimatorDirPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorDirPropNone', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorDirPropNone START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropNone);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('dirPropNone')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testimageAnimatorForPropNull
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorForPropNull', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorForPropNull START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropNull);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('forPropNull')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[imageAnimatorProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testimageAnimatorForPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorForPropOne', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorForPropOne START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropOne);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('forPropOne')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[imageAnimatorProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testimageAnimatorForPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorForPropThree', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorForPropThree START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropThree);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('forPropThree')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[imageAnimatorProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testimageAnimatorIfPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorIfPropTrue', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorIfPropTrue START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.ifPropTrue);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('ifPropTrue')
            expect(obj.$attrs.if).assertEqual(undefined)
            console.info("[imageAnimatorProps] get for value is: " + JSON.stringify(obj.$attrs.if));
            done();
        });

        /**
         * @tc.name   testimageAnimatorShowPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorShowPropTrue', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorShowPropTrue START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropTrue);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('showPropTrue')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[imageAnimatorProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testimageAnimatorShowPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorShowPropFalse', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorShowPropFalse START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropFalse);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('showPropFalse')
            expect(obj.$attrs.show).assertEqual('false')
            console.info("[imageAnimatorProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testimageAnimatorShowPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorShowPropNone', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorShowPropNone START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropNone);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('showPropNone')
            expect(obj.$attrs.show).assertEqual("false")
            console.info("[imageAnimatorProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testimageAnimatorImagePropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorImagePropNone', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorXsPropNone START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeImageNull);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('typeImageNull')
            expect(obj.$attrs.images).assertEqual(undefined)
            console.info("[imageAnimatorProps] get image value is: " + JSON.stringify(obj.$attrs.image));
            done();
        });

        /**
         * @tc.name   testimageAnimatorImageProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorImageProp', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorXsPropNone START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeImage);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('typeImage')
            expect(obj.$attrs.images).assertEqual(undefined)
            console.info("[imageAnimatorProps] get image value is: " + JSON.stringify(obj.$attrs.image));
            done();
        });

        /**
         * @tc.name   testimageAnimatorPredecodeProp2
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorPredecodeProp2', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorXsProp1 START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typePredecode2);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('typePredecode2')
            expect(obj.$attrs.predecode).assertEqual('2')
            console.info("[imageAnimatorProps] get predecode value is: " + JSON.stringify(obj.$attrs.predecode));
            done();
        });

        /**
         * @tc.name   testimageAnimatorIterationPropInfi
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorIterationPropInfi', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorXsPropObject START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeIterationInfi);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('typeIterationInfi')
            expect(obj.$attrs.iteration).assertEqual("infinite")
            console.info("[imageAnimatorProps] get iteration value is: " + JSON.stringify(obj.$attrs.iteration));
            done();
        });

        /**
         * @tc.name   testimageAnimatorIterationProp3
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorIterationProp3', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorXsPropObject START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeIteration3);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('typeIteration3')
            expect(obj.$attrs.iteration).assertEqual("3")
            console.info("[imageAnimatorProps] get iteration value is: " + JSON.stringify(obj.$attrs.iteration));
            done();
        });

        /**
         * @tc.name   testimageAnimatorReversePropNull
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorReversePropNull', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorXsProp1 START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeReverseNull);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('typeReverseNull')
            expect(obj.$attrs.reverse).assertEqual("false")
            console.info("[imageAnimatorProps] get reverse value is: " + JSON.stringify(obj.$attrs.reverse));
            done();
        });

        /**
         * @tc.name   testimageAnimatorReversePropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorReversePropFalse', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorXsProp1 START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeReverseFalse);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('typeReverseFalse')
            expect(obj.$attrs.reverse).assertEqual('false')
            console.info("[imageAnimatorProps] get reverse value is: " + JSON.stringify(obj.$attrs.reverse));
            done();
        });

        /**
         * @tc.name   testimageAnimatorReversePropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorReversePropTrue', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorXsProp1 START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeReverseTrue);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('typeReverseTrue')
            expect(obj.$attrs.reverse).assertEqual('true')
            console.info("[imageAnimatorProps] get reverse value is: " + JSON.stringify(obj.$attrs.reverse));
            done();
        });

        /**
         * @tc.name   testimageAnimatorFixedsizePropNull
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorFixedsizePropNull', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorXsProp1 START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeFixedsizeNull);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('typeFixedsizeNull')
            expect(obj.$attrs.fixedsize).assertEqual("true")
            console.info("[imageAnimatorProps] get fixedsize value is: " + JSON.stringify(obj.$attrs.fixedsize));
            done();
        });

        /**
         * @tc.name   testimageAnimatorFixedsizePropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorFixedsizePropFalse', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorXsProp1 START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeFixedsizeFalse);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('typeFixedsizeFalse')
            expect(obj.$attrs.fixedsize).assertEqual('false')
            console.info("[imageAnimatorProps] get fixedsize value is: " + JSON.stringify(obj.$attrs.fixedsize));
            done();
        });

        /**
         * @tc.name   testimageAnimatorFixedsizePropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorFixedsizePropTrue', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorXsProp1 START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeFixedsizeTrue);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('typeFixedsizeTrue')
            expect(obj.$attrs.fixedsize).assertEqual('true')
            console.info("[imageAnimatorProps] get fixedsize value is: " + JSON.stringify(obj.$attrs.fixedsize));
            done();
        });

        /**
         * @tc.name   testimageAnimatorFillmodePropNull
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorFillmodePropNull', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorXsPropObject START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeFillmodeNull);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('typeFillmodeNull')
            expect(obj.$attrs.fillmode).assertEqual("forwards")
            console.info("[imageAnimatorProps] get fillmode value is: " + JSON.stringify(obj.$attrs.fillmode));
            done();
        });

        /**
         * @tc.name   testimageAnimatorFillmodePropForwards
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorFillmodePropForwards', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorXsPropObject START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeFillmodeForwards);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('typeFillmodeForwards')
            expect(obj.$attrs.fillmode).assertEqual("forwards")
            console.info("[imageAnimatorProps] get fillmode value is: " + JSON.stringify(obj.$attrs.fillmode));
            done();
        });

        /**
         * @tc.name   testimageAnimatorFillmodePropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorFillmodePropNone', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorXsPropObject START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeFillmodeNone);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('typeFillmodeNone')
            expect(obj.$attrs.fillmode).assertEqual("none")
            console.info("[imageAnimatorProps] get fillmode value is: " + JSON.stringify(obj.$attrs.fillmode));
            done();
        });

        /**
         * @tc.name   testimageAnimatorDurationPropNull
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorDurationPropNull', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorXsPropObject START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeDurationNull);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('typeDurationNull')
            expect(obj.$attrs.duration).assertEqual(undefined)
            console.info("[imageAnimatorProps] get duration value is: " + JSON.stringify(obj.$attrs.duration));
            done();
        });

        /**
         * @tc.name   testimageAnimatorDurationProp3
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorDurationProp3', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorXsPropObject START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeDuration3);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('typeDuration3')
            expect(obj.$attrs.duration).assertEqual("3s")
            console.info("[imageAnimatorProps] get duration value is: " + JSON.stringify(obj.$attrs.duration));
            done();
        });

        /**
         * @tc.name   testimageAnimatorDurationProp6
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testimageAnimatorDurationProp6', Level.LEVEL0, async function(done) {
            console.info('testimageAnimatorXsPropObject START');
            console.info("[imageAnimatorProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typeDuration6);
            console.info("[imageAnimatorProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[imageAnimatorProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('image-animator')
            expect(obj.$attrs.id).assertEqual('typeDuration6')
            expect(obj.$attrs.duration).assertEqual("6s")
            console.info("[imageAnimatorProps] get duration value is: " + JSON.stringify(obj.$attrs.duration));
            done();
        });
    });
}