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
 import {describe, beforeAll,afterAll, it, expect} from '@ohos/hypium';
 
 
 export default function pickerViewPropsJsTest22() {  describe('pickerViewPropsJsTest22', function () {
 
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
             uri: 'pages/pickerView/prop22/index'
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
      * @tc.name      testPickerViewDisabledPropTrue
      * @tc.desc      ACE
      */
     it('testPickerViewDisabledPropTrue', 0, async function (done) {
         console.info('testPickerViewDisabledPropTrue START');
         console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));
 
         let obj = JSON.parse(globalThis.value.disabledPropTrue);
         console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
         console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));
 
         expect(obj.$type).assertEqual('picker-view')
         expect(obj.$attrs.id).assertEqual('disabledPropTrue')
         expect(obj.$attrs.disabled).assertEqual('true')
         done();
     });
 
     /**
      * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
      * @tc.name      testPickerViewDisabledPropFalse
      * @tc.desc      ACE
      */
     it('testPickerViewDisabledPropFalse', 0, async function (done) {
         console.info('testPickerViewDisabledPropFalse START');
         console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));
 
         let obj = JSON.parse(globalThis.value.disabledPropFalse);
         console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
         console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));
 
         expect(obj.$type).assertEqual('picker-view')
         expect(obj.$attrs.id).assertEqual('disabledPropFalse')
         expect(obj.$attrs.disabled).assertEqual('false')
         done();
     });
 
     /**
      * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
      * @tc.name      testPickerViewDisabledPropNone
      * @tc.desc      ACE
      */
     it('testPickerViewDisabledPropNone', 0, async function (done) {
         console.info('testPickerViewDisabledPropNone START');
         console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));
 
         let obj = JSON.parse(globalThis.value.disabledPropNone);
         console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
         console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));
 
         expect(obj.$type).assertEqual('picker-view')
         expect(obj.$attrs.id).assertEqual('disabledPropNone')
         expect(obj.$attrs.disabled).assertEqual('false')
         done();
     });
 
     /**
      * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
      * @tc.name      testPickerViewFocusablePropTrue
      * @tc.desc      ACE
      */
     it('testPickerViewFocusablePropTrue', 0, async function (done) {
         console.info('testPickerViewFocusablePropTrue START');
         console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));
 
         let obj = JSON.parse(globalThis.value.focusablePropTrue);
         console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
         console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));
 
         expect(obj.$type).assertEqual('picker-view')
         expect(obj.$attrs.id).assertEqual('focusablePropTrue')
         expect(obj.$attrs.focusable).assertEqual('true')
         done();
     });
 
     /**
      * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
      * @tc.name      testPickerViewFocusablePropFalse
      * @tc.desc      ACE
      */
     it('testPickerViewFocusablePropFalse', 0, async function (done) {
         console.info('testPickerViewFocusablePropFalse START');
         console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));
 
         let obj = JSON.parse(globalThis.value.focusablePropFalse);
         console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
         console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));
 
         expect(obj.$type).assertEqual('picker-view')
         expect(obj.$attrs.id).assertEqual('focusablePropFalse')
         expect(obj.$attrs.focusable).assertEqual('false')
         done();
     });
     /**
      * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
      * @tc.name      testPickerViewFocusablePropNone
      * @tc.desc      ACE
      */
     it('testPickerViewFocusablePropNone', 0, async function (done) {
         console.info('testPickerViewFocusablePropNone START');
         console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

         let obj = JSON.parse(globalThis.value.focusablePropNone);
         console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
         console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

         expect(obj.$type).assertEqual('picker-view')
         expect(obj.$attrs.id).assertEqual('focusablePropNone')
         expect(obj.$attrs.focusable).assertEqual('false')
         done();
     });

 });
}
