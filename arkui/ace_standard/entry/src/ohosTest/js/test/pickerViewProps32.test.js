/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@system.router';
import { describe, beforeAll, afterAll, it, expect, Level } from '@ohos/hypium';


export default function pickerViewPropsJsTest32() {
    describe('pickerViewPropsJsTest32', function() {

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
            })
            let clearPromise = new Promise((resolve, reject) => {
                setTimeout(() => {
                    router.clear();
                    resolve();
                }, 500);
            })
            await backToIndexPromise.then(() => {
                return clearPromise;
            })
        }

        /**
         * run before testcase
         */
        beforeAll(async function(done) {
            console.info('[pickerViewPropsJsTest] before each called')

            let result;
            let options = {
                uri: 'pages/pickerView/prop32/index'
            }
            try {
                result = router.push(options)
                console.info("push pickerViewProps page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push pickerViewProps page error " + JSON.stringify(result));
            }
            await sleep(4000)
            done()
        })

        /**
         * run after testcase
         */
        afterAll(async function() {
            console.info('[pickerViewPropsJsTest] after each called')
            await backToIndex()
            await sleep(1000)
        })

        /**
         * @tc.name   testPickerViewDataProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewDataProp', Level.LEVEL0, async function(done) {
            console.info('testPickerViewDataProp START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataProp);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('dataProp')
            expect(obj.$attrs.datapickerView).assertEqual(undefined);
            console.info("[pickerViewProps] get datapickerView value is: " + JSON.stringify(obj.$attrs.datapickerView));
            done();
        });

        /**
         * @tc.name   testPickerViewDataPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewDataPropNone', Level.LEVEL0, async function(done) {
            console.info('testPickerViewDataPropNone START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataPropNone);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('dataPropNone')
            expect(obj.$attrs.datapickerView).assertEqual(undefined)
            console.info("[pickerViewProps] get datapickerView value is: " + JSON.stringify(obj.$attrs.datapickerView));
            done();
        });

        /**
         * @tc.name   testPickerViewClickEffectPropSmall
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewClickEffectPropSmall', Level.LEVEL0, async function(done) {
            console.info('testPickerViewClickEffectPropSmall START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropSmall);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('clickEffectPropSmall')
            expect(obj.$attrs.clickEffect).assertEqual('spring-small')
            done();
        });

        /**
         * @tc.name   testPickerViewClickEffectPropMedium
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewClickEffectPropMedium', Level.LEVEL0, async function(done) {
            console.info('testPickerViewClickEffectPropMedium START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropMedium);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('clickEffectPropMedium')
            expect(obj.$attrs.clickEffect).assertEqual('spring-medium')
            done();
        });

        /**
         * @tc.name   testPickerViewClickEffectPropLarge
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewClickEffectPropLarge', Level.LEVEL0, async function(done) {
            console.info('testPickerViewClickEffectPropLarge START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropLarge);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('clickEffectPropLarge')
            expect(obj.$attrs.clickEffect).assertEqual('spring-large')
            done();
        });

        /**
         * @tc.name   testPickerViewClickEffectPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerViewClickEffectPropNone', Level.LEVEL0, async function(done) {
            console.info('testPickerViewClickEffectPropNone START');
            console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropNone);
            console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('picker-view')
            expect(obj.$attrs.id).assertEqual('clickEffectPropNone')
            expect(obj.$attrs.clickEffect).assertEqual(undefined)
            console.info("[pickerViewProps] get clickEffect value is: " + JSON.stringify(obj.$attrs.clickEffect));
            done();
        });

    });
}