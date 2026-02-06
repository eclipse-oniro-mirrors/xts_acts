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
import DecimalTest001 from './Decimal001.test';
import DecimalTest002 from './Decimal002.test';
import DecimalTest003 from './Decimal003.test';
import DecimalTest004 from './Decimal004.test';
export default function testsuite() {
  DecimalTest001();
  DecimalTest002();
  DecimalTest003();
  DecimalTest004();
}
