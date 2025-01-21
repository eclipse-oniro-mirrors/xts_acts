/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import deviceAttest from '@ohos.deviceAttest';
import { window } from '@kit.ArkUI';
import base from '@ohos.base';

export default function deviceAttestInfoTest(context: Context, windowStage:window.WindowStage,
                                             abilityStorage: LocalStorage) {
  describe('deviceAttestInfoTest', () =>  {
    console.info('describe deviceAttestInfoTest start!!!');
    beforeAll(() =>  {
      console.info('before all');
    })
    beforeEach(() =>  {
      console.info('before each');
    })
    afterEach(async (done: Function) =>   {
      console.info('afterEach');
      done();
    })
    afterAll(() =>  {
      console.info('afterAll');
    })

    /**
     * @tc.number     SUB_GRAPHIC_ENUMCOLORSPACE_JSAPI_001
     * @tc.name       Test function getAttestStatus() : Promise<AttestResultInfo>
     * @tc.desc       202 - Not System App. Interface caller is not a system app.
     */
    it('SUB_GRAPHIC_ENUMCOLORSPACE_JSAPI_001', 0, async (done:Function) => {
      console.info('test the enum value of attestResultInfo begin');
      try {
        deviceAttest.getAttestStatus().then((attestResultInfo: deviceAttest.AttestResultInfo) => {
          console.info("!!!====>[FormComponent]1:data====>" + JSON.stringify(attestResultInfo));
          expect(attestResultInfo.authResult).assertEqual(-2);
          expect(attestResultInfo.softwareResult).assertEqual(-2);
          expect(JSON.stringify(attestResultInfo.softwareResultDetail)).assertEqual(JSON.stringify([-2,-2,-2,-2,-2]));
          expect(attestResultInfo.ticket).assertEqual("");
          done();
        },(err: base.BusinessError) => {
          console.info("!!!====>[FormComponent]1:error_1====>" + JSON.stringify(err));
          expect(err.code == 202).assertTrue();
          done();
        })
      } catch(err) {
        console.info("!!!====>[FormComponent]1:error_2====>" + JSON.stringify(err));
        expect(err.code == 202).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     SUB_GRAPHIC_ENUMCOLORSPACE_JSAPI_002
     * @tc.name       Test function getAttestStatus(callback: AsyncCallback<AttestResultInfo>) : void
     * @tc.desc       202 - Not System App. Interface caller is not a system app.
     */
    it('SUB_GRAPHIC_ENUMCOLORSPACE_JSAPI_002', 0, async (done:Function) => {
      console.info('test the enum value of attestResultInfo begin');
      try{
        deviceAttest.getAttestStatus(async (err:base.BusinessError, attestResultInfo: deviceAttest.AttestResultInfo) => {
          if (err) {
            console.info("!!!====>[FormComponent]2:error_1====>" + JSON.stringify(err));
            expect(err.code == 202).assertTrue();
          } else {
            console.info("!!!====>[FormComponent]2:data====>" + JSON.stringify(attestResultInfo));
            expect(attestResultInfo.authResult).assertEqual(-2);
            expect(attestResultInfo.softwareResult).assertEqual(-2);
            expect(JSON.stringify(attestResultInfo.softwareResultDetail)).assertEqual(JSON.stringify([-2,-2,-2,-2,-2]));
            expect(attestResultInfo.ticket).assertEqual("");
          }
          done();
        });
      } catch(err) {
        console.info("!!!====>[FormComponent]2:error_2====>" + JSON.stringify(err));
        expect(err.code == 202).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     SUB_GRAPHIC_ENUMCOLORSPACE_JSAPI_003
     * @tc.name       Test function getAttestStatusSync() : AttestResultInfo;
     * @tc.desc       202 - Not System App. Interface caller is not a system app.
     */
    it('SUB_GRAPHIC_ENUMCOLORSPACE_JSAPI_003', 0, async (done:Function) => {
      console.info('test the enum value of attestResultInfo begin');
      try{
        let attestResultInfo: deviceAttest.AttestResultInfo = deviceAttest.getAttestStatusSync();
        if(attestResultInfo != null && attestResultInfo != undefined){
          console.info("!!!====>[FormComponent]3:data====>" + JSON.stringify(attestResultInfo));
          expect(attestResultInfo.authResult).assertEqual(-2);
          expect(attestResultInfo.softwareResult).assertEqual(-2);
          expect(JSON.stringify(attestResultInfo.softwareResultDetail)).assertEqual(JSON.stringify([-2,-2,-2,-2,-2]));
          expect(attestResultInfo.ticket).assertEqual("");
        } else {
          console.info("!!!====>[FormComponent]3:error_1====>");
          expect().assertTrue();
        }
        done();
      } catch(err) {
        console.info("!!!====>[FormComponent]3:error_2====>" + JSON.stringify(err));
        expect(err.code).assertEqual(202);
        done();
      }
    })
  })
}