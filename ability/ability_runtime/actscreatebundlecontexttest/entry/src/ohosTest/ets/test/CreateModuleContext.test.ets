/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { application, appManager, common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { resourceManager } from '@kit.LocalizationKit'
import { hilog } from '@kit.PerformanceAnalysisKit';

let context = getContext(this) as common.UIAbilityContext;

let sleep = async (delay: number): Promise<void> => {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};

export default function createModuleContextTest() {
  describe('createModuleContextTest', () => {

    beforeAll(() => {
      context = globalThis.context
    })
    beforeEach(async () => {
      await sleep(2000);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AMS_Context_CreateModuleContext_2300
     * @tc.number SUB_Ability_AbilityRuntime_AMS_Context_CreateModuleContext_2300
     * @tc.desc   createModuleContext,moduleName = feature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_AMS_Context_CreateModuleContext_2300', Level.LEVEL3, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_AMS_Context_CreateModuleContext_2300`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tag}, it begin`);
      try {
        application.createModuleContext(context, 'entry_test').then((data: Context) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${tag} createBundleContext success! data is :${JSON.stringify(data)}`);
          // getConfigurationSync
          let value = context.resourceManager.getConfigurationSync();
          hilog.info(0x0000, 'testTag', '%{public}s', `resourceManager.getConfigurationSync value is: ${JSON.stringify(value)}`)
          let direction = value.direction;
          let locale = value.locale;
          let colorMode = value.colorMode
          // getConfiguration
          try {
            context.resourceManager.getConfiguration((error: BusinessError, value1: resourceManager.Configuration) => {
              if (error != null) {
                console.error("getConfiguration callback error is " + error);
              } else {
                hilog.info(0x0000, 'testTag', '%{public}s', `resourceManager.getConfiguration value is: ${JSON.stringify(value1)}`)
                expect(direction).assertEqual(value1.direction)
                expect(locale).assertEqual(value1.locale)
                expect(colorMode).assertEqual(value1.colorMode)
              }
            });
          } catch (error) {
            let code = (error as BusinessError).code;
            let message = (error as BusinessError).message;
            hilog.error(0x0000, 'testTag', '%{public}s', `getConfiguration failed, error code: ${code}, message: ${message}.`);
            expect().assertFail()
            done();
          }
          // getString
          try {
            context.resourceManager.getString(33554435, (error: Error, value: string) => {
              if (error != null) {
                hilog.error(0x0000, 'testTag', '%{public}s', `getString failed, error is ${error}`);
              } else {
                let str = value;
                hilog.info(0x0000, 'testTag', '%{public}s', `resourceManager.getString labelStr is: ${JSON.stringify(str)}`)
                expect(str).assertEqual("test_label")
              }
            });
          } catch (error) {
            let code = (error as BusinessError).code;
            let message = (error as BusinessError).message;
            hilog.error(0x0000, 'testTag', '%{public}s', `getConfiguration failed, error code: ${code}, message: ${message}.`);
            expect().assertFail()
            done();
          }
          // getStringSync
          try {
            let labelStr = context.resourceManager.getStringSync(33554435);
            hilog.info(0x0000, 'testTag', '%{public}s', `resourceManager.getStringSync labelStr is: ${JSON.stringify(labelStr)}`)
            expect(labelStr).assertEqual("test_label")
          } catch (error) {
            let code = (error as BusinessError).code;
            let message = (error as BusinessError).message;
            hilog.error(0x0000, 'testTag', '%{public}s', `getStringSync failed, error code: ${code}, message: ${message}.`);
            expect().assertFail()
            done();
          }
          checkFeatureModuleContext(data, tag, done);
        }).catch((error: BusinessError) => {
          hilog.error(0x0000, 'testTag', '%{public}s', `${tag} createModuleContext failed, error.code: ${(error as BusinessError).code}, error.message: ${(error as BusinessError).message}`);
        })
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s', `createModuleContext failed, error.code: ${(error as BusinessError).code}, error.message: ${(error as BusinessError).message}`);
      }
    });
  })
}

function checkFeatureModuleContext(data: Context, tag: string, done: Function): void {
  expect(JSON.stringify(data.applicationInfo.name)).assertEqual('"com.acts.actscreatebundlecontexttest"');  // 测试应用名称是否正确
  expect(JSON.stringify(data.applicationInfo.bundleType)).assertEqual('0');  // 测试bundleType是否为0
  expect(JSON.stringify(data.applicationInfo.debug)).assertEqual('false');  // 测试是否处于调试模式
  expect(JSON.stringify(data.applicationInfo.description)).assertEqual('""');  // 测试应用描述是否为空
  expect(JSON.stringify(data.applicationInfo.descriptionId)).assertEqual('0');  // 测试描述的ID是否为0
  expect(JSON.stringify(data.applicationInfo.label)).assertEqual('"$string:app_name"');  // 测试应用标签是否正确
  expect(JSON.stringify(data.applicationInfo.labelId)).assertEqual('33554435');  // 测试标签的ID是否匹配
  expect(JSON.stringify(data.applicationInfo.icon)).assertEqual('"$media:app_icon"');  // 测试图标资源是否正确
  expect(JSON.stringify(data.applicationInfo.iconId)).assertEqual('33554438');  // 测试图标的ID是否匹配
  expect(JSON.stringify(data.applicationInfo.process)).assertEqual('"com.acts.actscreatebundlecontexttest"');  // 测试进程名称是否正确
  expect(JSON.stringify(data.applicationInfo.iconResource.bundleName)).assertEqual('"com.acts.actscreatebundlecontexttest"');  // 测试图标资源的bundle名称
  expect(JSON.stringify(data.applicationInfo.iconResource.moduleName)).assertEqual('"entry_test"');  // 测试图标资源的模块名称是否正确
  expect(JSON.stringify(data.applicationInfo.iconResource.id)).assertEqual('33554438');  // 测试图标的ID是否正确
  expect(JSON.stringify(data.applicationInfo.labelResource.bundleName)).assertEqual('"com.acts.actscreatebundlecontexttest"');  // 测试标签资源的bundle名称
  expect(JSON.stringify(data.applicationInfo.labelResource.moduleName)).assertEqual('"entry_test"');  // 测试标签资源的模块名称是否正确
  expect(JSON.stringify(data.applicationInfo.labelResource.id)).assertEqual('33554435');  // 测试标签资源的ID是否正确
  expect(JSON.stringify(data.applicationInfo.descriptionResource.bundleName)).assertEqual('"com.acts.actscreatebundlecontexttest"');  // 测试描述资源的bundle名称
  expect(JSON.stringify(data.applicationInfo.descriptionResource.moduleName)).assertEqual('"entry_test"');  // 测试描述资源的模块名称是否正确
  expect(JSON.stringify(data.applicationInfo.descriptionResource.id)).assertEqual('0');  // 测试描述资源的ID是否正确
  expect(JSON.stringify(data.applicationInfo.appDistributionType)).assertEqual('"os_integration"');  // 测试应用分发类型是否正确
  expect(JSON.stringify(data.applicationInfo.appProvisionType)).assertEqual('"release"');  // 测试应用提供类型是否正确
  expect(JSON.stringify(data.applicationInfo.flags)).assertEqual('1');  // 测试应用的标志是否正确
  expect(JSON.stringify(data.applicationInfo.permissions)).assertEqual('[]');  // 测试应用权限是否为空数组
  expect(JSON.stringify(data.applicationInfo.systemApp)).assertEqual('false');  // 测试是否为系统应用
  expect(JSON.stringify(data.applicationInfo.dataUnclearable)).assertEqual('false');  // 测试应用数据是否不可清除
  expect(JSON.stringify(data.applicationInfo.installSource)).assertEqual('"unknown"');  // 测试应用的安装来源是否正确
  expect(typeof(data.applicationInfo.releaseType)).assertEqual('string'); //测试应用的发布版本字段是string类型
  expect(JSON.stringify(data.eventHub)).not().assertNull();  // 测试事件中心是否存在
  hilog.info(0x0000, 'testTag', '%{public}s', `${tag}, it end`);
  done();
}
