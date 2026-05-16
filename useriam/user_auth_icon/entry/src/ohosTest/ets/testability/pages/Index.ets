/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import userAuth from '@ohos.userIAM.userAuth';
import UserAuthIcon from '@ohos.userIAM.userAuthIcon';

@Entry
@Component
struct Index {
  @State result: string = '******';
  authParam: userAuth.AuthParam = {
    challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
    authType: [2],
    authTrustLevel: -1,
  };
  widgetParam: userAuth.WidgetParam = {
    title: '请进行身份认证',
  };

  build() {
    Row() {
      Column() {
        Text("authTrustLevel=-1")
          .fontSize(20)
          .fontWeight(FontWeight.Normal)
          .textAlign(TextAlign.Center)
        UserAuthIcon({
          authParam: this.authParam,
          widgetParam: this.widgetParam,
          iconHeight: 64,
          iconColor: Color.Blue,
          onIconClick: () => {
            console.info('The user clicked the icon.');
          },
          onAuthResult: (result: userAuth.UserAuthResult) => {
            console.info('Get user auth result, result = ' + JSON.stringify(result));
            this.result = result.result.toString()
          },
        })
        Text("结果码")
          .fontSize(20)
          .fontWeight(FontWeight.Normal)
          .textAlign(TextAlign.Center)
        Text(this.result)
          .fontSize(20)
          .fontWeight(FontWeight.Normal)
          .textAlign(TextAlign.Center)
      }
    }
  }
}