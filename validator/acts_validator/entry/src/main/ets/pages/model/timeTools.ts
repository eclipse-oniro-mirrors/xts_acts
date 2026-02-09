/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
export function fillNum(num) {
  if (num < 10) {
    return '0' + num
  }
  return num.toString()
}

export function getTimeString(time) {
  if (time == -1 || time == undefined) {
    time = 0
  }
  let hour = Math.floor(time % (1000 * 60 * 60 * 24) / (1000 * 60 * 60))
  let minute = Math.floor(time % (1000 * 60 * 60) / (1000 * 60))
  let second = Math.floor(time % (1000 * 60) / 1000)
  if (hour > 0) {
    return `${fillNum(hour)}:${fillNum(minute)}:${fillNum(second)}`
  }
  return `${fillNum(minute)}:${fillNum(second)}`
}