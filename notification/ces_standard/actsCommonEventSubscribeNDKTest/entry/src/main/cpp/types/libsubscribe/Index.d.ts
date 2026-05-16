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

export const create_subscribe_info: (events: Array<string>) => number;
export const set_publisher_permission: (permission: string) => void;
export const set_publisher_bundleName: (bundleName: string) => void;
export const destroy_subscribe_info: () => number;
export const create_subscriber: () => number;
export const destroy_subscriber: () => number;
export const common_event_subscribe: () => number;
export const common_event_unsubscribe: () => number;
export const release_subscribe_info: () => void;
export const release_subscriber: () => void;