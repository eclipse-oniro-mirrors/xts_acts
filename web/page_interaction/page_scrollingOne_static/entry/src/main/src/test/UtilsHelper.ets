/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import emitter from '@ohos.events.emitter';
import { expect } from '../../../hypium/index';
import { ComponentInfo, RectInfo } from './Interfaces';
import { Component, Driver, ON, PointerMatrix } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import systemDateTime from '@ohos.systemDateTime';

export default class UtilsHelpers {
  static extractRectFromJson(rawJson: string): string {
    console.info('extractRectFromJson 输入rawJson：' + rawJson);
    if (!rawJson || rawJson.length === 0) {
      console.error("extractRectFromJson：输入字符串为空");
      return "";
    }

    let rectContent = '';
    let isFindingRect = false;
    let isCollecting = false;
    let keyFound = false;

    for (let i = 0; i < rawJson.length; i++) {
      const currChar = rawJson[i];
      console.debug(`current position i: ${i}, currChar: "${currChar}", isFindingRect: ${isFindingRect}, isCollecting: ${isCollecting}`);

      if (!keyFound && currChar === '"' && !isCollecting) {
        let tempStr = '';
        let j = i + 1;

        while (j < rawJson.length && rawJson[j] !== '"') {
          tempStr += rawJson[j];
          j++;
        }

        if (j >= rawJson.length) {
          console.info("extractRectFromJson：未找到键名的结束引号，跳过");
          continue;
        }

        if (tempStr === '$rect') {
          isFindingRect = true;
          keyFound = true;
          i = j;
          console.debug(`found $rect, position of i: ${i}`);
          continue;
        }
      }

      if (isFindingRect && !isCollecting) {
        if (currChar === ':' || currChar === ' ' || currChar === '\n' || currChar === '\t' || currChar === '\r') {
          continue;
        } else if (currChar === '"') {
          isCollecting = true;
          isFindingRect = false;
          console.debug(`found the first " of $rect`);
          continue;
        } else {
          console.info("extractRectFromJson：遇到非预期字符，重置状态");
          isFindingRect = false;
          keyFound = false;
        }
      }

      if (isCollecting) {
        if (currChar === '"') {
          console.info(`found the last " of $rect, done: ${rectContent}`);
          break;
        } else {
          rectContent += currChar;
          console.debug(`loading...rectContent: ${rectContent}`);
        }
      }
    }

    console.info(`extractRectFromJson rectContent：${rectContent}`);
    return rectContent;
  }

  static splitRectToNumbers(rectStr: string): number[] {
    if (!rectStr || rectStr.length === 0) {
      console.error("splitRectToNumbers：null string");
      return [];
    }

    const numberList: number[] = [];
    let cleanedStr = '';
    let currentNumStr = '';

    for (let i = 0; i < rectStr.length; i++) {
      const currChar = rectStr[i];
      if (currChar !== '[' && currChar !== ']') {
        cleanedStr += currChar;
      }
    }

    for (let j = 0; j < cleanedStr.length; j++) {
      const currChar = cleanedStr[j];
      if (currChar === ',') {
        const trimmedNum = currentNumStr.trim();
        if (trimmedNum !== '') {
          const num = UtilsHelpers.strToNumber(trimmedNum);
          numberList.push(num);
        }
        currentNumStr = '';
      } else {
        currentNumStr += currChar;
      }
    }

    const lastTrimmedNum = currentNumStr.trim();
    if (lastTrimmedNum !== '') {
      const num = UtilsHelpers.strToNumber(lastTrimmedNum);
      numberList.push(num);
    }

    return numberList;
  }

  private static strToNumber(numStr: string): number {
    if (!numStr || numStr.length === 0) return 0;

    let integerPart = 0;
    let decimalPart = 0;
    let decimalLength = 0;
    let isDecimal = false;

    for (let k = 0; k < numStr.length; k++) {
      const currChar = numStr[k];
      const charCode = currChar.charCodeAt(0);

      if (charCode >= 48 && charCode <= 57) {
        const digit = charCode - 48;
        if (!isDecimal) {
          integerPart = (integerPart * 10 + digit).toInt();
        } else {
          decimalPart = (decimalPart * 10 + digit).toInt();
          decimalLength++;
        }
      }
      else if (currChar === '.' && !isDecimal) {
        isDecimal = true;
      }
      else {
        return 0;
      }
    }

    const finalNum = integerPart + (decimalPart / Math.pow(10, decimalLength));
    return finalNum;
  }

  static jsonToRectInfo(rawJson: string): RectInfo {
    console.info('jsonToRectInfo(key) = ' + rawJson);
    const rectInfo = new RectInfo();
    if (!rawJson || rawJson.length === 0) {
      console.error("jsonToRectInfo：输入JSON字符串为空");
      return rectInfo;
    }

    const rectStr = UtilsHelpers.extractRectFromJson(rawJson);
    if (rectStr === '') {
      console.error("jsonToRectInfo：未提取到$rect");
      return rectInfo;
    }

    const rectNumbers = UtilsHelpers.splitRectToNumbers(rectStr);
    if (rectNumbers.length !== 4) {
      console.error(`jsonToRectInfo：$rect数值异常：需4个，实际${rectNumbers.length}个`);
      return rectInfo;
    }

    rectInfo.left = rectNumbers[0];
    rectInfo.top = rectNumbers[1];
    rectInfo.right = rectNumbers[2];
    rectInfo.bottom = rectNumbers[3];
    console.info("rectInfo.left = " + rectNumbers[0]);
    console.info("rectInfo.top = " + rectNumbers[1]);
    console.info("rectInfo.right = " + rectNumbers[2]);
    console.info("rectInfo.bottom = " + rectNumbers[3]);

    return rectInfo;
  }

  static getComponentRect(rawJson: string): RectInfo {
    let strJson: string = inspector.getInspectorByKey(rawJson);
    console.info('getInspectorByKey(key) = ' + strJson);
    return UtilsHelpers.jsonToRectInfo(strJson);
  }
}