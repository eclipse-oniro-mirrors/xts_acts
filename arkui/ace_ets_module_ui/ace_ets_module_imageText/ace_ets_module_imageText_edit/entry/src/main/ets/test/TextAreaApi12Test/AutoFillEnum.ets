/**
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

declare enum ContentType {
  /**
   * User name content type.
   *
   * @syscap SystemCapability.ArkUI.ArkUI.Full
   * @atomicservice
   * @since 12
   */
  USER_NAME = 0,

  /**
   * Password content type.
   *
   * @syscap SystemCapability.ArkUI.ArkUI.Full
   * @atomicservice
   * @since 12
   */
  PASSWORD = 1,

  /**
   * New password content type.
   *
   * @syscap SystemCapability.ArkUI.ArkUI.Full
   * @atomicservice
   * @since 12
   */
  NEW_PASSWORD = 2,

  /**
   * Full street address content type.
   *
   * @syscap SystemCapability.ArkUI.ArkUI.Full
   * @atomicservice
   * @since 12
   */
  FULL_STREET_ADDRESS = 3,

  /**
   * House number content type.
   *
   * @syscap SystemCapability.ArkUI.ArkUI.Full
   * @atomicservice
   * @since 12
   */
  HOUSE_NUMBER = 4,

  /**
   * District address content type.
   *
   * @syscap SystemCapability.ArkUI.ArkUI.Full
   * @atomicservice
   * @since 12
   */
  DISTRICT_ADDRESS = 5,

  /**
   * City address content type.
   *
   * @syscap SystemCapability.ArkUI.ArkUI.Full
   * @atomicservice
   * @since 12
   */
  CITY_ADDRESS = 6,

  /**
   * Province address content type.
   *
   * @syscap SystemCapability.ArkUI.ArkUI.Full
   * @atomicservice
   * @since 12
   */
  PROVINCE_ADDRESS = 7,

  /**
   * Country address content type.
   *
   * @syscap SystemCapability.ArkUI.ArkUI.Full
   * @atomicservice
   * @since 12
   */
  COUNTRY_ADDRESS = 8,

  /**
   * Person full name content type.
   *
   * @syscap SystemCapability.ArkUI.ArkUI.Full
   * @atomicservice
   * @since 12
   */
  PERSON_FULL_NAME = 9,

  /**
   * Person last name content type.
   *
   * @syscap SystemCapability.ArkUI.ArkUI.Full
   * @atomicservice
   * @since 12
   */
  PERSON_LAST_NAME = 10,

  /**
   * Person first name content type.
   *
   * @syscap SystemCapability.ArkUI.ArkUI.Full
   * @atomicservice
   * @since 12
   */
  PERSON_FIRST_NAME = 11,

  /**
   * Phone number content type.
   *
   * @syscap SystemCapability.ArkUI.ArkUI.Full
   * @atomicservice
   * @since 12
   */
  PHONE_NUMBER = 12,

  /**
   * Phone country code content type.
   *
   * @syscap SystemCapability.ArkUI.ArkUI.Full
   * @atomicservice
   * @since 12
   */
  PHONE_COUNTRY_CODE = 13,

  /**
   * Full phone number content type.
   *
   * @syscap SystemCapability.ArkUI.ArkUI.Full
   * @atomicservice
   * @since 12
   */
  FULL_PHONE_NUMBER = 14,

  /**
   * Email address content type.
   *
   * @syscap SystemCapability.ArkUI.ArkUI.Full
   * @atomicservice
   * @since 12
   */
  EMAIL_ADDRESS = 15,

  /**
   * Bank card number content type.
   *
   * @syscap SystemCapability.ArkUI.ArkUI.Full
   * @atomicservice
   * @since 12
   */
  BANK_CARD_NUMBER = 16,

  /**
   * ID card number content type.
   *
   * @syscap SystemCapability.ArkUI.ArkUI.Full
   * @atomicservice
   * @since 12
   */
  ID_CARD_NUMBER = 17,

  /**
   * Nickname content type.
   *
   * @syscap SystemCapability.ArkUI.ArkUI.Full
   * @atomicservice
   * @since 12
   */
   NICKNAME = 23, 

  /**
   * Detail info without street content type.
   *
   * @syscap SystemCapability.ArkUI.ArkUI.Full
   * @atomicservice
   * @since 12
   */
   DETAIL_INFO_WITHOUT_STREET = 24,

  /**
   * Format address content type.
   *
   * @syscap SystemCapability.ArkUI.ArkUI.Full
   * @atomicservice
   * @since 12
   */
   FORMAT_ADDRESS = 25
}

export default ContentType;