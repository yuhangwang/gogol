{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}
{-# LANGUAGE TypeOperators      #-}

{-# OPTIONS_GHC -fno-warn-unused-imports    #-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}

-- |
-- Module      : Network.Google.Resource.Mapsengine.Rasters.Permissions.BatchUpdate
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- | Add or update permission entries to an already existing asset. An asset
-- can hold up to 20 different permission entries. Each batchInsert request
-- is atomic.
--
-- /See:/ <https://developers.google.com/maps-engine/ Google Maps Engine API Reference> for @MapsengineRastersPermissionsBatchUpdate@.
module Network.Google.Resource.Mapsengine.Rasters.Permissions.BatchUpdate
    (
    -- * REST Resource
      RastersPermissionsBatchUpdateResource

    -- * Creating a Request
    , rastersPermissionsBatchUpdate'
    , RastersPermissionsBatchUpdate'

    -- * Request Lenses
    , rpbuQuotaUser
    , rpbuPrettyPrint
    , rpbuUserIp
    , rpbuKey
    , rpbuId
    , rpbuOauthToken
    , rpbuFields
    , rpbuAlt
    ) where

import           Network.Google.MapEngine.Types
import           Network.Google.Prelude

-- | A resource alias for @MapsengineRastersPermissionsBatchUpdate@ which the
-- 'RastersPermissionsBatchUpdate'' request conforms to.
type RastersPermissionsBatchUpdateResource =
     "rasters" :>
       Capture "id" Text :>
         "permissions" :>
           "batchUpdate" :>
             QueryParam "quotaUser" Text :>
               QueryParam "prettyPrint" Bool :>
                 QueryParam "userIp" Text :>
                   QueryParam "key" Text :>
                     QueryParam "oauth_token" Text :>
                       QueryParam "fields" Text :>
                         QueryParam "alt" Alt :>
                           Post '[JSON] PermissionsBatchUpdateResponse

-- | Add or update permission entries to an already existing asset. An asset
-- can hold up to 20 different permission entries. Each batchInsert request
-- is atomic.
--
-- /See:/ 'rastersPermissionsBatchUpdate'' smart constructor.
data RastersPermissionsBatchUpdate' = RastersPermissionsBatchUpdate'
    { _rpbuQuotaUser   :: !(Maybe Text)
    , _rpbuPrettyPrint :: !Bool
    , _rpbuUserIp      :: !(Maybe Text)
    , _rpbuKey         :: !(Maybe Text)
    , _rpbuId          :: !Text
    , _rpbuOauthToken  :: !(Maybe Text)
    , _rpbuFields      :: !(Maybe Text)
    , _rpbuAlt         :: !Alt
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'RastersPermissionsBatchUpdate'' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rpbuQuotaUser'
--
-- * 'rpbuPrettyPrint'
--
-- * 'rpbuUserIp'
--
-- * 'rpbuKey'
--
-- * 'rpbuId'
--
-- * 'rpbuOauthToken'
--
-- * 'rpbuFields'
--
-- * 'rpbuAlt'
rastersPermissionsBatchUpdate'
    :: Text -- ^ 'id'
    -> RastersPermissionsBatchUpdate'
rastersPermissionsBatchUpdate' pRpbuId_ =
    RastersPermissionsBatchUpdate'
    { _rpbuQuotaUser = Nothing
    , _rpbuPrettyPrint = True
    , _rpbuUserIp = Nothing
    , _rpbuKey = Nothing
    , _rpbuId = pRpbuId_
    , _rpbuOauthToken = Nothing
    , _rpbuFields = Nothing
    , _rpbuAlt = JSON
    }

-- | Available to use for quota purposes for server-side applications. Can be
-- any arbitrary string assigned to a user, but should not exceed 40
-- characters. Overrides userIp if both are provided.
rpbuQuotaUser :: Lens' RastersPermissionsBatchUpdate' (Maybe Text)
rpbuQuotaUser
  = lens _rpbuQuotaUser
      (\ s a -> s{_rpbuQuotaUser = a})

-- | Returns response with indentations and line breaks.
rpbuPrettyPrint :: Lens' RastersPermissionsBatchUpdate' Bool
rpbuPrettyPrint
  = lens _rpbuPrettyPrint
      (\ s a -> s{_rpbuPrettyPrint = a})

-- | IP address of the site where the request originates. Use this if you
-- want to enforce per-user limits.
rpbuUserIp :: Lens' RastersPermissionsBatchUpdate' (Maybe Text)
rpbuUserIp
  = lens _rpbuUserIp (\ s a -> s{_rpbuUserIp = a})

-- | API key. Your API key identifies your project and provides you with API
-- access, quota, and reports. Required unless you provide an OAuth 2.0
-- token.
rpbuKey :: Lens' RastersPermissionsBatchUpdate' (Maybe Text)
rpbuKey = lens _rpbuKey (\ s a -> s{_rpbuKey = a})

-- | The ID of the asset to which permissions will be added.
rpbuId :: Lens' RastersPermissionsBatchUpdate' Text
rpbuId = lens _rpbuId (\ s a -> s{_rpbuId = a})

-- | OAuth 2.0 token for the current user.
rpbuOauthToken :: Lens' RastersPermissionsBatchUpdate' (Maybe Text)
rpbuOauthToken
  = lens _rpbuOauthToken
      (\ s a -> s{_rpbuOauthToken = a})

-- | Selector specifying which fields to include in a partial response.
rpbuFields :: Lens' RastersPermissionsBatchUpdate' (Maybe Text)
rpbuFields
  = lens _rpbuFields (\ s a -> s{_rpbuFields = a})

-- | Data format for the response.
rpbuAlt :: Lens' RastersPermissionsBatchUpdate' Alt
rpbuAlt = lens _rpbuAlt (\ s a -> s{_rpbuAlt = a})

instance GoogleRequest RastersPermissionsBatchUpdate'
         where
        type Rs RastersPermissionsBatchUpdate' =
             PermissionsBatchUpdateResponse
        request = requestWithRoute defReq mapEngineURL
        requestWithRoute r u
          RastersPermissionsBatchUpdate'{..}
          = go _rpbuQuotaUser (Just _rpbuPrettyPrint)
              _rpbuUserIp
              _rpbuKey
              _rpbuId
              _rpbuOauthToken
              _rpbuFields
              (Just _rpbuAlt)
          where go
                  = clientWithRoute
                      (Proxy ::
                         Proxy RastersPermissionsBatchUpdateResource)
                      r
                      u