/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

 import bundle from '@ohos.bundle.bundleManager';
import { BusinessError } from '@ohos.base';
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
 
 export default function getApplicationLabel(): void {
   describe('getApplicationLabel', (): void => {
 
     /**
      * @tc.name   SUB_BMS_FRAMEWORK_GETAPPLICATIONLABELSTATIC_2000
      * @tc.number SUB_BMS_FRAMEWORK_GETAPPLICATIONLABELSTATIC_2000
      * @tc.desc   Check the normal bundleName and appIndex
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('SUB_BMS_FRAMEWORK_GETAPPLICATIONLABELSTATIC_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
       async (done: () => void): Promise<void> => {
         await bundle.getApplicationLabel("ohos.acts.bundlemanagererrcode.test.static", 0).then((data: string) => {
           console.info( 'getApplicationLabelNormal success: ' + JSON.stringify(data));
           expect(data).assertEqual("label");
           done();
         }).catch((err: Error):void => {
           console.info( 'getApplicationLabelNormal failed: ' + JSON.stringify(err));
           expect().assertFail();
           done();
         })
       })
 
     /**
      * @tc.name   SUB_BMS_FRAMEWORK_GETAPPLICATIONLABELSTATIC_2100
      * @tc.number SUB_BMS_FRAMEWORK_GETAPPLICATIONLABELSTATIC_2100
      * @tc.desc   Check getApplicationLabel with null bundleName
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('SUB_BMS_FRAMEWORK_GETAPPLICATIONLABELSTATIC_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
       async (done: () => void): Promise<void> => {
         await bundle.getApplicationLabel("", 0).then((data: string) => {
           console.info( 'getApplicationLabelNullBundleName success: ' + JSON.stringify(data));
           expect().assertFail();
           done();
         }).catch((err: Error):void => {
           let message = (err as BusinessError).message;
           let code = (err as BusinessError).code;
           console.info( 'getApplicationLabelNullBundleName failed: ' + JSON.stringify(err) + code + "==>" + message);
           expect(code).assertEqual(17700001);
           expect(message).assertEqual('BusinessError 17700001: The specified bundle is not found.')
           done();
         })
       })
 
     /**
      * @tc.name   SUB_BMS_FRAMEWORK_GETAPPLICATIONLABELSTATIC_2200
      * @tc.number SUB_BMS_FRAMEWORK_GETAPPLICATIONLABELSTATIC_2200
      * @tc.desc   Check getApplicationLabel with invalid bundleName
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('SUB_BMS_FRAMEWORK_GETAPPLICATIONLABELSTATIC_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
       async (done: () => void): Promise<void> => {
         await bundle.getApplicationLabel("ohos.acts.bundlemanagererrcode.test.static", -1).then((data: string) => {
           console.info( 'getApplicationLabelInvalidBundleName success: ' + JSON.stringify(data));
           expect().assertFail();
           done();
         }).catch((err: Error) :void=> {
           let message = (err as BusinessError).message;
           let code = (err as BusinessError).code;
           console.info( 'getApplicationLabelNullBundleName failed: ' + JSON.stringify(err) + code + "==>" + message)
           expect(code).assertEqual(17700061);
           expect(message).assertEqual('BusinessError 17700061: The specified app index is invalid.')
           done();
         })
       })
 
   })
 }