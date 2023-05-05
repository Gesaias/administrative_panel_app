enum EAirportStatus {
  enabled,
  disabled,
}

extension AirportStatus on EAirportStatus {
  int get value {
    switch (this) {
      case EAirportStatus.enabled:
        return 0;
      case EAirportStatus.disabled:
        return 1;
    }
  }
}
