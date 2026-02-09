/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permission and
 * limitations under the License.
 */

import { describe, beforeAll, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Utils';
import { abilityAccessCtrl, PermissionRequestResult, common, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@ohos.base';
import { Driver, ON } from '@ohos.UiTest';

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function RequestPermissionOnSettingTest() {
  describe('RequestPermissionOnSettingTest', () => {
    console.info('##########start RequestPermissionOnSettingTest');
    beforeAll(() => {
      console.info('########## RequestPermissionOnSettingTest beforeAll');
    })
    afterEach(() => {
      console.info('########## RequestPermissionOnSettingTest afterEach');
    })


    /**
     * @tc.name   Test_requestPermissionOnSetting_001
     * @tc.number Test_requestPermissionOnSetting_001
     * @tc.desc   test requestPermissionOnSetting result is nonempty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_requestPermissionOnSetting_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      hilog.info(domain,tag,"Test_requestPermissionOnSetting_001 start ");
      let context: Context = getContext(globalThis) as common.UIAbilityContext;
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionList: Array<Permissions> = new Array<Permissions>("ohos.permission.READ_CALENDAR");
      try {
        //1.申请权限弹框，并选择拒绝授权
        hilog.info(domain,'testTag',"Test_requestPermissionOnSetting_001 begin request Permission from user");
        atManager.requestPermissionsFromUser(context, permissionList).then(async (data: PermissionRequestResult):Promise<void> => {
          hilog.info(domain,tag,"Test_requestPermissionOnSetting_001 requestPermissionsFromUser data " + JSON.stringify(data));
          expect(data.permissions.length).assertEqual(permissionList.length);
          expect(data.authResults[0]).assertEqual(-1);//-1:DENIED
          expect(data.dialogShownResults?.[0]).assertEqual(true);
          hilog.info(domain,tag,"Test_requestPermissionOnSetting_001 requestPermissionsFromUser expect ");

          //2.申请已经被用户拒绝授予的权限
          atManager.requestPermissionOnSetting(context, permissionList).then((data: Array<abilityAccessCtrl.GrantStatus>):void => {
            hilog.info(domain,'testTag',"Test_requestPermissionOnSetting_001 requestPermissionOnSetting data " + JSON.stringify(data));
            expect(data[0]!=null).assertTrue()
            expect(data.length).assertEqual(permissionList.length);
            done();
          }).catch((error: BusinessError) => {
            hilog.info(domain,tag,"Test_requestPermissionOnSetting_001 catch inner err" + JSON.stringify(error));
            expect(true).assertFail();
            done();
          });
          await Utils.sleep(1000);
          let driver2 = Driver.create();
          let button3 = await driver2.findComponent(ON.text('确定'));
          let button4 = await driver2.findComponent(ON.text('禁止'));
          await Utils.sleep(500);
          console.info('Test_requestPermissionOnSetting_001 button3 is:' + JSON.stringify(button3));
          console.info('Test_requestPermissionOnSetting_001 button4 is:' + JSON.stringify(button4));
          if(button3!== null){
            console.info("Test_requestPermissionOnSetting_001 button3 Click START====");
            await button3.click();
            console.info("Test_requestPermissionOnSetting_001 button3 reClick====");
          }
          if(button4!== null){
            console.info("Test_requestPermissionOnSetting_001 button4Click START====");
            await button4.click();
            console.info("Test_requestPermissionOnSetting_001 button4 reClick====");
          }
        });
        await Utils.sleep(1000);
        let driver1 = Driver.create();
        let button1 = await driver1.findComponent(ON.text('不允许'));
        let button2 = await driver1.findComponent(ON.text('禁止'));
        await Utils.sleep(500);
        console.info('Test_requestPermissionOnSetting_001 button1 is:' + JSON.stringify(button1));
        console.info('Test_requestPermissionOnSetting_001 button2 is:' + JSON.stringify(button2));
        if(button1!== null){
          console.info("Test_requestPermissionOnSetting_001 button1Click START====");
          await button1.click();
          console.info("Test_requestPermissionOnSetting_001 button1 reClick====");
        }
        if(button2!== null){
          console.info("Test_requestPermissionOnSetting_001 button2Click START====");
          await button2.click();
          console.info("Test_requestPermissionOnSetting_001 button2 reClick====");
        }
      } catch (error) {
        hilog.info(domain,tag,"Test_requestPermissionOnSetting_001 catch err" + error.code);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   Test_getSelfPermissionStatus_007
     * @tc.number Test_getSelfPermissionStatus_007
     * @tc.desc   test getSelfPermissionStatus result is DENIED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_getSelfPermissionStatus_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      hilog.info(domain, tag, "Test_getSelfPermissionStatus_007 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let context: Context = getContext(globalThis) as common.UIAbilityContext;
      let permissionList: Array<Permissions> = new Array<Permissions>("ohos.permission.WRITE_CALENDAR");
      try {
        //1.申请权限弹框，并选择拒绝授权
        hilog.info(domain,'testTag',"Test_getSelfPermissionStatus_007 begin request Permission from user");
        atManager.requestPermissionsFromUser(context, permissionList).then((data: PermissionRequestResult): void => {
          hilog.info(domain,tag,"Test_getSelfPermissionStatus_007 requestPermissionsFromUser data " + JSON.stringify(data));
          expect(data.permissions.length).assertEqual(permissionList.length);
          expect(data.authResults[0]).assertEqual(-1);//-1:DENIED
          expect(data.dialogShownResults?.[0]).assertEqual(true);
          hilog.info(domain,tag,"Test_getSelfPermissionStatus_007 requestPermissionsFromUser expect ");

          //2. 查询授权结果
          let res: abilityAccessCtrl.PermissionStatus = atManager.getSelfPermissionStatus("ohos.permission.WRITE_CALENDAR");
          hilog.info(domain,tag,"Test_getSelfPermissionStatus_007 getSelfPermissionStatus res " + JSON.stringify(res));
          expect(res).assertEqual(abilityAccessCtrl.PermissionStatus.DENIED); //-1:DENIED
          done();
        });
        await Utils.sleep(1000);
        let driver3 = Driver.create();
        let button1 = await driver3.findComponent(ON.text('不允许'));
        let button2 = await driver3.findComponent(ON.text('禁止'));
        await Utils.sleep(500);
        console.info('Test_getSelfPermissionStatus_007 button1 is:' + JSON.stringify(button1));
        console.info('Test_getSelfPermissionStatus_007 button2 is:' + JSON.stringify(button2));
        if(button1!== null){
          console.info("Test_getSelfPermissionStatus_007 button1Click START====");
          await button1.click();
          console.info("Test_getSelfPermissionStatus_007 button1 reClick====");
        }
        if(button2!== null){
          console.info("Test_getSelfPermissionStatus_007 button2Click START====");
          await button2.click();
          console.info("Test_getSelfPermissionStatus_007 button2 reClick====");
        }
      } catch (error) {
        hilog.info(domain, tag, "Test_getSelfPermissionStatus_007 catch err" + error.code);
        expect(false).assertTrue();
        done();
      }
    })
  })
}