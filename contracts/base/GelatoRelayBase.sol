// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import {
    GelatoRelayContractsUtils
} from "../utils/GelatoRelayContractsUtils.sol";
import {
    GELATO_RELAY_V1,
    GELATO_RELAY_V2,
    GELATO_RELAY_ZKSYNC_V1,
    GELATO_RELAY_ZKSYNC_V2
} from "../constants/GelatoRelay.sol";

abstract contract GelatoRelayBase is GelatoRelayContractsUtils {
    modifier onlyGelatoRelay() {
        require(_isGelatoRelay(msg.sender), "onlyGelatoRelay");
        _;
    }

    function _isGelatoRelay(address _forwarder) internal view returns (bool) {
        if (_isV1ZkSyncChainId) {
            return _forwarder == GELATO_RELAY_ZKSYNC_V1;
        }
        if (_isV2ZkSyncChainId) {
            return _forwarder == GELATO_RELAY_ZKSYNC_V2;
        }
        if (_isV1ChainId) {
            return _forwarder == GELATO_RELAY_V1;
        }
        return _forwarder == GELATO_RELAY_V2;
    }
}
