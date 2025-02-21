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
 
 
 describe('pickerViewPropsJsTest2111', function () {
 
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
             uri: 'pages/pickerView/prop2111/index'
         }
         try {
             result = router.push(options)
             console.info("push pickerViewProps page success " + JSON.stringify(result));
         } catch (err) {
             console.error("push pickerViewProps page error " + JSON.stringify(result));
         }
         await sleep(2000)
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
      * @tc.name      testPickerViewIdProp
      * @tc.desc      ACE
      */
     it('testPickerViewIdProp', 0, async function (done) {
         console.info('testPickerViewIdProp START');
         console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));
 
         let obj = JSON.parse(globalThis.value.idProp);
         console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
         console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));
 
         expect(obj.$type).assertEqual('picker-view')
         expect(obj.$attrs.id).assertEqual('idProp')
         done();
     });
 

 
//     /**
//      * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
//      * @tc.name      testPickerViewStyleProp
//      * @tc.desc      ACEs
//      */
//     it('testPickerViewStyleProp', 0, async function (done) {
//         console.info('testPickerViewStyleProp START');
//         console.info("[pickerViewProps] get globalThis.value is: " + JSON.stringify(globalThis.value));
//
//         let obj = JSON.parse(globalThis.value.styleProp);
//         console.info("[pickerViewProps] get inspector value is: " + JSON.stringify(obj));
//         console.info("[pickerViewProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));
//
//         expect(obj.$type).assertEqual('picker-view')
//         expect(obj.$attrs.id).assertEqual('styleProp')
//         expect(obj.$attrs.style).assertEqual(undefined)
//         console.info("[pickerViewProps] get style value is: " + JSON.stringify(obj.$attrs.style));
//
//         expect(obj.$styles.width).assertEqual(undefined);
//         console.info("[pickerViewProps] get style width value is: " + JSON.stringify(obj.$styles.width));
//         expect(obj.$styles.height).assertEqual(undefined);
//         console.info("[pickerViewProps] get style height value is: " + JSON.stringify(obj.$styles.height));
//         expect(obj.$styles.get('background-color')).assertEqual(undefined);
//         done();
//     });

 });
