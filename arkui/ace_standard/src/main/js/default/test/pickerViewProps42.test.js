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
 
 
 describe('pickerViewPropsJsTest42', function () {
 
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
             uri: 'pages/pickerView/prop42/index'
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
      * @tc.name      testPickerViewForPropNull
      * @tc.desc      ACE
      */
     it('testPickerViewForPropNull', 0, async function (done) {
         console.info('testPickerViewForPropNull START');
         console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));
 
         let obj = JSON.parse(globalThis.value.forPropNull);
         console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
         console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));
 
         expect(obj.$type).assertEqual('picker-view')
         expect(obj.$attrs.id).assertEqual('forPropNull')
         expect(obj.$attrs.for).assertEqual(undefined)
         console.info("[pickerViewProps] get for value is: " + JSON.stringify(obj.$attrs.for));
         done();
     });
 
     /**
      * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
      * @tc.name      testPickerViewForPropOne
      * @tc.desc      ACE
      */
     it('testPickerViewForPropOne', 0, async function (done) {
         console.info('testPickerViewForPropOne START');
         console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));
 
         let obj = JSON.parse(globalThis.value.forPropOne);
         console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
         console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));
 
         expect(obj.$type).assertEqual('picker-view')
         expect(obj.$attrs.id).assertEqual('forPropOne')
         expect(obj.$attrs.for).assertEqual(undefined)
         console.info("[pickerViewProps] get for value is: " + JSON.stringify(obj.$attrs.for));
         done();
     });
 
     /**
      * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
      * @tc.name      testPickerViewForPropThree
      * @tc.desc      ACE
      */
     it('testPickerViewForPropThree', 0, async function (done) {
         console.info('testPickerViewForPropThree START');
         console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));
 
         let obj = JSON.parse(globalThis.value.forPropThree);
         console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
         console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));
 
         expect(obj.$type).assertEqual('picker-view')
         expect(obj.$attrs.id).assertEqual('forPropThree')
         expect(obj.$attrs.for).assertEqual(undefined)
         console.info("[pickerViewProps] get for value is: " + JSON.stringify(obj.$attrs.for));
         done();
     });
 
     /**
      * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
      * @tc.name      testPickerViewIfPropTrue
      * @tc.desc      ACE
      */
     it('testPickerViewIfPropTrue', 0, async function (done) {
         console.info('testPickerViewIfPropTrue START');
         console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));
 
         let obj = JSON.parse(globalThis.value.ifPropTrue);
         console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
         console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));
 
         expect(obj.$type).assertEqual('picker-view')
         expect(obj.$attrs.id).assertEqual('ifPropTrue')
         expect(obj.$attrs.if).assertEqual(undefined)
         console.info("[pickerViewProps] get for value is: " + JSON.stringify(obj.$attrs.if));
         done();
     });
 
     /**
      * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
      * @tc.name      testPickerViewIfPropFalse
      * @tc.desc      ACE
      */
     /* it('testPickerViewIfPropFalse', 0, async function (done) {
         console.info('testPickerViewIfPropFalse START');
         console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

         let obj = JSON.parse(globalThis.value.ifPropFalse);
         console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
         console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

         expect(obj.$type).assertEqual('picker-view')
         expect(obj.$attrs.id).assertEqual('ifPropFalse')
         expect(obj.$attrs.if).assertEqual(false)
         done();
     }); */

     /**
      * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
      * @tc.name      testPickerViewIfPropNone
      * @tc.desc      ACE
      */
     /* it('testPickerViewIfPropNone', 0, async function (done) {
         console.info('testPickerViewIfPropNone START');
         console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

         let obj = JSON.parse(globalThis.value.ifPropNone);
         console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
         console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

         expect(obj.$type).assertEqual('picker-view')
         expect(obj.$attrs.id).assertEqual('ifPropNone')
         expect(obj.$attrs.if).assertEqual(false)
         done();
     }); */
 
     /**
      * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
      * @tc.name      testPickerViewShowPropTrue
      * @tc.desc      ACE
      */
     it('testPickerViewShowPropTrue', 0, async function (done) {
         console.info('testPickerViewShowPropTrue START');
         console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));
 
         let obj = JSON.parse(globalThis.value.showPropTrue);
         console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
         console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));
 
         expect(obj.$type).assertEqual('picker-view')
         expect(obj.$attrs.id).assertEqual('showPropTrue')
         expect(obj.$attrs.show).assertEqual('true')
         console.info("[pickerViewProps] get show value is: " + JSON.stringify(obj.$attrs.show));
         done();
     });
 
     /**
      * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
      * @tc.name      testPickerViewShowPropFalse
      * @tc.desc      ACE
      */
     it('testPickerViewShowPropFalse', 0, async function (done) {
         console.info('testPickerViewShowPropFalse START');
         console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));
 
         let obj = JSON.parse(globalThis.value.showPropFalse);
         console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
         console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));
 
         expect(obj.$type).assertEqual('picker-view')
         expect(obj.$attrs.id).assertEqual('showPropFalse')
         expect(obj.$attrs.show).assertEqual('false')
         console.info("[pickerViewProps] get show value is: " + JSON.stringify(obj.$attrs.show));
         done();
     });
 
     /**
      * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
      * @tc.name      testPickerViewShowPropNone
      * @tc.desc      ACE
      */
     it('testPickerViewShowPropNone', 0, async function (done) {
         console.info('testPickerViewShowPropNone START');
         console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));
 
         let obj = JSON.parse(globalThis.value.showPropNone);
         console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
         console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));
 
         expect(obj.$type).assertEqual('picker-view')
         expect(obj.$attrs.id).assertEqual('showPropNone')
         expect(obj.$attrs.show).assertEqual('true')
         console.info("[pickerViewProps] get show value is: " + JSON.stringify(obj.$attrs.show));
         done();
     });

 });
