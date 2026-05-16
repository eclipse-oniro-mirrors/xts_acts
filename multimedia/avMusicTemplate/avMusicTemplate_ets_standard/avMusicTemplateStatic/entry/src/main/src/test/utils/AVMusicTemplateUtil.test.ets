/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import avMusicTemplate from '@ohos.multimedia.avMusicTemplate';
import { CommonUtils } from './CommonUtil.test';

const TAG = 'AVMusicTemplateUtil';
const TEMPLATE_TYPE = avMusicTemplate.AVMusicTemplateType.fromValue('smartCar');
export const BUNDLE_NAME = 'com.example.myapplication';

export class AVMusicTemplateUtil {
  private static template: avMusicTemplate.AVMusicTemplate | undefined;
  private static controller: avMusicTemplate.AVMusicTemplateController | undefined;

  static getTemplate(): avMusicTemplate.AVMusicTemplate {
    if (!AVMusicTemplateUtil.template) {
      AVMusicTemplateUtil.template = avMusicTemplate.createAVMusicTemplate(TEMPLATE_TYPE);
    }
    return AVMusicTemplateUtil.template as avMusicTemplate.AVMusicTemplate;
  }

  static getController(): avMusicTemplate.AVMusicTemplateController {
    if (!AVMusicTemplateUtil.controller) {
      AVMusicTemplateUtil.getTemplate();
      const des: avMusicTemplate.AVMusicTemplateDescriptor[] = avMusicTemplate.getAllAVMusicTemplateDescriptors();
      let sessionId = '';
      for (let item of des) {
        if (item.bundleName === BUNDLE_NAME) {
          sessionId = item.sessionId;
          break;
        }
      }
      CommonUtils.logInfo(TAG, `sessionId=${sessionId}`);
      AVMusicTemplateUtil.controller = avMusicTemplate.createAVMusicTemplateController(sessionId);
      CommonUtils.logInfo(TAG, `controller=${JSON.stringify(AVMusicTemplateUtil.controller)}`);
    }
    return AVMusicTemplateUtil.controller as avMusicTemplate.AVMusicTemplateController;
  }

  static async destroy() {
    AVMusicTemplateUtil.controller?.destroy();
    AVMusicTemplateUtil.controller = undefined;
    AVMusicTemplateUtil.template?.destroy();
    AVMusicTemplateUtil.template = undefined;
    CommonUtils.msSleep(1000);
  }
}