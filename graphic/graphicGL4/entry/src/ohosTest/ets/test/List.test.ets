/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
 
import libGl4ApiTest from './LibGl4Api.test';
import EmptyTest from './Empty.test';
import gl4api from 'libentry.so';

export default function testsuite() {
  let flagNum = 1;
  try {
    let result: number = gl4api.isSupportGL();
    console.info('www data isSupportGLv4', result);
    flagNum = result;
  } catch(err){
    flagNum = 1;
    console.info('www data error isSupportGLv4', flagNum);
  }
  if (canIUse("SystemCapability.Graphic.Graphic2D.GL4") && flagNum == 0){
    libGl4ApiTest();
  }else{
    EmptyTest()
  }
}