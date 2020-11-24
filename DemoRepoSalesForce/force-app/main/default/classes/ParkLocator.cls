public class ParkLocator {
    public static List<string> country(String country){
                ParkService.ParksImplPort Locator = new ParkService.ParksImplPort();
        return Locator.byCountry(country);
    }

}