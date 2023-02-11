class MainActivity : AppCompatActivity() {
   override fun onCreate(savedInstanceState: Bundle?) {
      super.onCreate(savedInstanceState)
      setContentView(R.layout.activity_main)
      val prefs = PreferenceManager.getDefaultSharedPreferences(this)
      if (prefs.getString("weather", ) != null) {
         val intent = Intent(this, WeatherActivity::class.java)
         startActivity(intent)
         finish()
      }
   }
}