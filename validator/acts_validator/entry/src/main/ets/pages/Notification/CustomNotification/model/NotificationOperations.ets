/*
* Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
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

import image from '@ohos.multimedia.image';
import { wantAgentUtil } from '../notificationUtil/WantAgentUtil';
import { notificationContentUtil } from '../notificationUtil/NotificationContentUtil';
import { notificationRequestUtil } from '../notificationUtil/NotificationRequestUtil';
// import { notificationUtil } from '../notificationUtil/NotificationUtil';
import notification from '@ohos.notificationManager';
import logger from '../../../model/Logger';
import emitter from '@ohos.events.emitter';
import { NotificationUtil } from '../notificationUtil/NotificationUtil';

interface notificationIdType {
  BASIC: number,
  LONG_TEXT: number,
  MULTI_LINE: number,
  PICTURE: number,
  BUTTON: number,
  WANTAGENT: number
};

const TAG: string = 'NotificationOperations';
const BUNDLE_NAME: string = 'com.example.actsvalidator';
const ABILITY_NAME: string = 'MainAbility';
const MULTI_LINE_CONTENT: Array<string> = ['line0', 'line1', 'line2', 'line3']; // 多行文本通知的多行文本内容

const enum NOTIFICATION_ID { // 定义不同类型通知的通知id
  BASIC = 1,
  LONG_TEXT = 2,
  MULTI_LINE = 3,
  PICTURE = 4,
  BUTTON = 5,
  WANTAGENT = 6
};

export default class NotificationOperations {
  private context: Context | undefined = undefined;
  private basicContent: notification.NotificationBasicContent | undefined = undefined;
  private notificationUtil = new NotificationUtil();
  selectCount: number = 0;
  countOne: number = 0;
  countTwo: number = 0;
  countThree: number = 0;
  countFour: number = 0;
  countFive: number = 0;
  countSix: number = 0;

  // 在初始化函数初始化基本通知类型的参数
  constructor(context: Context) {
    this.context = context;
    let notificationTitle = '';
    let notificationText = '通知内容';
    let notificationAdditional = '通知次要内容';
    this.basicContent = {
      title: notificationTitle,
      text: notificationText,
      additionalText: notificationAdditional
    };
  }

  // 发布基本类型通知
  publishBasicNotification = () => {
    try {
      if (this.context !== undefined && this.context !== null && this.basicContent !== undefined) {
        logger.info(TAG, `publishBasicNotification`);
        this.basicContent.title = '基本型通知';
        let notificationContent = notificationContentUtil.initBasicNotificationContent(this.basicContent);
        this.notificationUtil.publishNotification(notificationRequestUtil.initBasicNotificationRequest(notificationContent), NOTIFICATION_ID.BASIC);
        this.countOne++;
        if (this.countOne === 1) {
          this.selectCount++;
          let eventData: emitter.EventData = {
            data: {
              "content": this.selectCount,
              "id": 1,
              "flag": true,
            }
          };

          let innerEvent: emitter.InnerEvent = {
            eventId: 1,
            priority: emitter.EventPriority.HIGH
          };

          emitter.emit(innerEvent, eventData);
        }
      }
    } catch (error) {
      logger.info(TAG, `publishBasicNotification error, error = ${JSON.stringify(error)}`);
    }
  }
  // 发布长文本类型通知
  publishLongTextNotification = () => {
    try {
      if (this.context !== undefined && this.context !== null && this.basicContent !== undefined && this.basicContent !== null) {
        logger.info(TAG, `publishLongTextNotification`);
        this.basicContent.title = '长文本型通知';
        let notificationLongText = '通知的长文本';
        let notificationBriefText = '通知概要内容，是对通知内容的总结。';
        let notificationExpandedText = '通知展开时的标题';
        let notificationContent = notificationContentUtil.initNotificationLongTextContent(this.basicContent, notificationLongText, notificationBriefText, notificationExpandedText);
        this.notificationUtil.publishNotification(notificationRequestUtil.initBasicNotificationRequest(notificationContent), NOTIFICATION_ID.LONG_TEXT);
        this.countTwo++;
        if (this.countTwo === 1) {
          this.selectCount++;
          let eventData2: emitter.EventData = {
            data: {
              "content": this.selectCount,
              "id": 2,
              "flag": true,
            }
          };

          let innerEvent2: emitter.InnerEvent = {
            eventId: 2,
            priority: emitter.EventPriority.HIGH
          };

          emitter.emit(innerEvent2, eventData2);
        }
      }
    } catch (error) {
      logger.info(TAG, `publishLongTextNotification error, error = ${JSON.stringify(error)}`);
    }
  }
  // 发布多行文本类型通知
  publishMultiLineNotification = () => {
    try {
      if (this.context !== undefined && this.context !== null && this.basicContent !== undefined && this.basicContent !== null) {
        logger.info(TAG, `publishMultiLineNotification`);
        this.basicContent.title = '多行文本型通知';
        let notificationBriefText = '"通知概要内容，是对通知内容的总结。';
        let notificationLongTitle = '通知展开时的标题';
        let notificationContent = notificationContentUtil.initNotificationMultiLineContent(this.basicContent, notificationBriefText, notificationLongTitle, MULTI_LINE_CONTENT);
        this.notificationUtil.publishNotification(notificationRequestUtil.initBasicNotificationRequest(notificationContent), NOTIFICATION_ID.MULTI_LINE);
        this.countThree++;
        if (this.countThree === 1) {
          this.selectCount++;
          let eventData3: emitter.EventData = {
            data: {
              "content": this.selectCount,
              "id": 3,
              "flag": true,
            }
          };

          let innerEvent3: emitter.InnerEvent = {
            eventId: 3,
            priority: emitter.EventPriority.HIGH
          };

          emitter.emit(innerEvent3, eventData3);
        }
      }
    } catch (error) {
      logger.info(TAG, `publishMultiLineNotification error, error = ${JSON.stringify(error)}`);
    }
  }
  // 发布图片类型通知
  publishPictureNotification = async () => {
    try {
      if (this.context !== undefined && this.context !== null && this.basicContent !== undefined && this.basicContent !== null) {
        logger.info(TAG, `publishPictureNotification`);
        this.basicContent.title = '图片型通知';
        let notificationBriefText = '通知概要内容，是对通知内容的总结。';
        let notificationExpandedText = '通知展开时的标题';
        let imageArray = await this.context.resourceManager.getMedia($r('app.media.notification_icon').id);
        let imageResource = image.createImageSource(imageArray.buffer.slice(0));
        let picture = await imageResource.createPixelMap();
        let notificationContent = notificationContentUtil.initNotificationPictureContent(this.basicContent, notificationBriefText, notificationExpandedText, picture);
        this.notificationUtil.publishNotification(notificationRequestUtil.initBasicNotificationRequest(notificationContent), NOTIFICATION_ID.PICTURE);
        this.countFour++;
        if (this.countFour === 1) {
          this.selectCount++;
          let eventData4: emitter.EventData = {
            data: {
              "content": this.selectCount,
              "id": 4,
              "flag": true
            }
          };

          let innerEvent4: emitter.InnerEvent = {
            eventId: 4,
            priority: emitter.EventPriority.HIGH
          };

          emitter.emit(innerEvent4, eventData4);
        }
      }
    } catch (error) {
      logger.info(TAG, `publishPictureNotification error, error = ${JSON.stringify(error)}`);
    }
  }
  // 发布带按钮的通知
  publishNotificationWithButtons = async () => {
    try {
      if (this.context !== undefined && this.context !== null && this.basicContent !== undefined && this.basicContent !== null) {
        logger.info(TAG, `publishNotificationWithButtons`);
        this.basicContent.title = '带按钮的通知';
        let actionButtons: notification.NotificationActionButton[] = [
          {
            title: '第一个按钮',
            wantAgent: await wantAgentUtil.createWantAgentForCommonEvent('')
          },
          {
            title: '第二个按钮',
            wantAgent: await wantAgentUtil.createWantAgentForStartAbility(BUNDLE_NAME, ABILITY_NAME)
          }
        ]
        let notificationContent = notificationContentUtil.initBasicNotificationContent(this.basicContent);
        let notificationRequest = notificationRequestUtil.initButtonNotificationRequest(notificationContent, actionButtons);
        this.notificationUtil.publishNotification(notificationRequest, NOTIFICATION_ID.BUTTON);
        this.countFive++;
        if (this.countFive === 1) {
          this.selectCount++;
          let eventData5: emitter.EventData = {
            data: {
              "content": this.selectCount,
              "flag": true,
              "id": 5,
            }
          };

          let innerEvent5: emitter.InnerEvent = {
            eventId: 5,
            priority: emitter.EventPriority.HIGH
          };

          emitter.emit(innerEvent5, eventData5);
        }
      }
    } catch (error) {
      logger.info(TAG, `publishNotificationWithButtons error, error = ${JSON.stringify(error)}`);
    }
  }
  // 发布点击跳转到应用的通知
  publishNotificationWithWantAgent = async () => {
    try {
      logger.info(TAG, `publishNotificationWithWantAgent`);
      if (this.context !== undefined && this.context !== null && this.basicContent !== undefined && this.basicContent !== null) {
        this.basicContent.title = '点击可跳转的通知';
        let notificationWantAgent = await wantAgentUtil.createWantAgentForStartAbility(BUNDLE_NAME, ABILITY_NAME);
        let notificationContent = notificationContentUtil.initBasicNotificationContent(this.basicContent);
        let notificationRequest = notificationRequestUtil.initWantAgentNotificationRequest(notificationContent, notificationWantAgent);
        this.notificationUtil.publishNotification(notificationRequest, NOTIFICATION_ID.WANTAGENT);
        this.countSix++;
        if (this.countSix === 1) {
          this.selectCount++;
          let eventData6: emitter.EventData = {
            data: {
              "content": this.selectCount,
              "flag": true,
              "id": 6,
            }
          };

          let innerEvent6: emitter.InnerEvent = {
            eventId: 6,
            priority: emitter.EventPriority.HIGH
          };

          emitter.emit(innerEvent6, eventData6);
        }
      }
    } catch (error) {
      logger.info(TAG, `publishNotificationWithWantAgent error, error = ${JSON.stringify(error)}`);
    }
  }
}
