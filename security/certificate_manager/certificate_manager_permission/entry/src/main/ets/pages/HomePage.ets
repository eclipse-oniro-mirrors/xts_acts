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
import certManagerDialog from '@ohos.security.certManagerDialog';
import type common from '@ohos.app.ability.common';

export class GlobalContext {
  private constructor() {
  }

  private static instance: common.Context;
  private _objects = new Map<string, Object>();
  public static getContext(): common.Context {
    if (!GlobalContext.instance) {
      GlobalContext.instance = getContext();
    }
    return GlobalContext.instance;
  }
  getObject(value: string): Object | undefined {
    return this._objects.get(value);
  }
  setObject(key: string, objectClass: Object): void {
    this._objects.set(key, objectClass);
  }
}
@Component
@Entry

struct HomePage {

  @State currentPageIndex: number = -1;

  build() {
    Column() {
      Scroll() {
        Column() {
          Button('打开证书管理')
            .width('100%')
            .buttonStyle(ButtonStyleMode.NORMAL)
            .onClick(event => {
              certManagerDialog.openCertificateManagerDialog(
                getContext(this),
                certManagerDialog.CertificateDialogPageType.PAGE_MAIN
                );
            })
            .margin({ top: 24 })

          Button('打开CA 证书')
            .width('100%')
            .buttonStyle(ButtonStyleMode.NORMAL)
            .onClick(event => {
              certManagerDialog.openCertificateManagerDialog(
                getContext(this),
                certManagerDialog.CertificateDialogPageType.PAGE_CA_CERTIFICATE
                );
            })
            .margin({ top: 24 })

          Button('打开凭据列表')
            .width('100%')
            .buttonStyle(ButtonStyleMode.NORMAL)
            .onClick(event => {
              certManagerDialog.openCertificateManagerDialog(
                getContext(this),
                certManagerDialog.CertificateDialogPageType.PAGE_CREDENTIAL
                );
            })
            .margin({ top: 24 })

          Button('打开从存储设备安装')
            .width('100%')
            .buttonStyle(ButtonStyleMode.NORMAL)
            .onClick(event => {
              certManagerDialog.openCertificateManagerDialog(
                getContext(this),
                certManagerDialog.CertificateDialogPageType.PAGE_INSTALL_CERTIFICATE
                );
            })
            .margin({ top: 24 })
        }.width('100%')
      }
      .padding({
        left: 12,
        right: 12
      })
      .align(Alignment.Top)
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Auto)
      .edgeEffect(EdgeEffect.Spring)
      .width('100%')
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
  }
}