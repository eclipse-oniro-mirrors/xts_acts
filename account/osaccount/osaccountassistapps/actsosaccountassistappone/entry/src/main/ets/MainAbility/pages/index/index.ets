/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import osAccount from '@ohos.account.osAccount'
import common from '@ohos.app.ability.common';
import commonEventManager from '@ohos.commonEventManager'

@Entry
@Component
struct Index {
  private context = getContext(this) as common.UIAbilityContext;

  async aboutToAppear(){
    console.info('====>Only has ohos.permission.GET_DOMAIN_ACCOUNTS Assist app aboutToAppear');
    let accountManager: osAccount.AccountManager = osAccount.getAccountManager();
    console.info('====>get os AccountManager finish====');
    let publishData : string = ''
    try {
      let domainInfo : osAccount.DomainAccountInfo = await accountManager.getOsAccountDomainInfo(100);
      console.info('====>in assist 0700 domainInfo: ' + domainInfo);
      publishData = String(domainInfo)
    } catch (err) {
      console.info('====>in assist 0700 catch err: ' + JSON.stringify(err));
      console.info('====>in assist 0700 catch err.code: ' + JSON.stringify(err.code));
      publishData = String(err.code)
    }
    let commonEventPublishData : commonEventManager.CommonEventPublishData = {
      data: publishData
    }
    commonEventManager.publish('os_account_permission1', commonEventPublishData, async (err) => {
      console.info('====>in assist 0700 publish err: ' + JSON.stringify(err));
      await this.context.terminateSelf();
      console.info('====>Only has ohos.permission.GET_DOMAIN_ACCOUNTS Assist app end');
    });
  }

  build() {
    Flex({ direction:FlexDirection.Column, alignItems:ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text('OA Assist App One')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Button() {
        Text('next page')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }.type(ButtonType.Capsule)
      .margin({
        top: 20
      })
      .backgroundColor('#0D9FFB')
      .onClick(() => {

      })
    }
    .width('100%')
    .height('100%')
  }
}