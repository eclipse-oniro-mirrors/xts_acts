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
 import {describe, beforeAll,afterAll, it, expect} from 'deccjsunit/index';
 
 
 describe('pickerViewPropsJsTest32', function () {
 
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
     beforeAll(async function (done) {
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
     afterAll(async function () {
         console.info('[pickerViewPropsJsTest] after each called')
         await backToIndex()
         await sleep(1000)
     })

     /**
      * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
      * @tc.name      testPickerViewDataProp
      * @tc.desc      ACE
      */
     it('testPickerViewDataProp', 0, async function (done) {
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
      * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
      * @tc.name      testPickerViewDataPropNone
      * @tc.desc      ACE
      */
     it('testPickerViewDataPropNone', 0, async function (done) {
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
      * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
      * @tc.name      testPickerViewClickEffectPropSmall
      * @tc.desc      ACE
      */
     it('testPickerViewClickEffectPropSmall', 0, async function (done) {
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
      * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
      * @tc.name      testPickerViewClickEffectPropMedium
      * @tc.desc      ACE
      */
     it('testPickerViewClickEffectPropMedium', 0, async function (done) {
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
      * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
      * @tc.name      testPickerViewClickEffectPropLarge
      * @tc.desc      ACE
      */
     it('testPickerViewClickEffectPropLarge', 0, async function (done) {
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
      * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
      * @tc.name      testPickerViewClickEffectPropNone
      * @tc.desc      ACE
      */
     it('testPickerViewClickEffectPropNone', 0, async function (done) {
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
